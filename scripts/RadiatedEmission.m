%% Reading for the ESRP
%
%
%
%

addpath ../functions/.      % access 'functions'     folder
addpath ../correctedData/.  % access 'correctedData' folder

if ~exist('connection', 'var')
    initializeConnection;	% establishing a connection
end

%% ----------- SETUP ------------------------------------------------------

oETH.setDetector('qpeak');

oETH.setStartFrequency(30e6,0);
oETH.setStartFrequency(150e3,1);
oETH.setStartFrequency(30e6,2);

oETH.setStopFrequency(1e9,0);
oETH.setStopFrequency(30e6,1);
oETH.setStopFrequency(3e9,2);

oETH.setFreqStepSize(4e3,1);
oETH.setFreqStepSize(120e3,2);

oETH.setMeasBandwidth(9e3,1);
oETH.setMeasBandwidth(120e3,2);

oETH.setMeasTime(200e-3,1);
oETH.setMeasTime(50e-3,2);

oETH.setAttenuation(10,1);
oETH.setAttenuation(0,2);

oETH.setPreAmp('off',1);
oETH.setPreAmp('off',2);


oETH.actReceiverMode;
oETH.setAutoBandwidth('off');
oETH.singleSweep;
oETH.setInputAttenuation('off');


%% --------- Measurement --------------------------------------------------

oETH.singleSweep;

oETH.startMeasurement;

pause(10); % workarround. Probably time violation. Otherwise errors appear.

%% ------------------------------------------------------------------------

% --------- Queries unit of y-Axis ----------------------------------------

oETH.write('CALC:UNIT:POW?; *WAI');
unit = oETH.read;

switch unit
    case 'DBUV'
        dataunit = 'dBuV';
    otherwise
        dataunit = 'unit unknown';
        error(['Wrong unit! (', unit, ')']);
end


% --------- Queries the set parameters ------------------------------------

write(oETH, 'FREQ:START?; *WAI')
fstart = read(oETH);
write(oETH, 'SCAN1:STAR?; *WAI')
fstart1 = read(oETH);
write(oETH, 'SCAN2:STAR?; *WAI')
fstart2 = read(oETH);

write(oETH,  'FREQ:STOP?; *WAI')
fstop = read(oETH);
write(oETH, 'SCAN1:STOP?; *WAI')
fstop1 = read(oETH);
write(oETH, 'SCAN2:STOP?; *WAI')
fstop2 = read(oETH);

write(oETH, 'SCAN1:STEP?; *WAI')
fstep1 = read(oETH);
write(oETH, 'SCAN2:STEP?; *WAI')
fstep2 = read(oETH);

% --------- Check the frequency range -------------------------------------

if (fstart < fstart1) || (fstop > fstop2)
    warning('Frequenzbereich nicht definiert!'), f_data = [];
else
    if (fstart < fstop1) && (fstop <= fstop1)
        f1 = (fstart:fstep1:fstop)';
        f2 = [];
    elseif fstart >= fstart2
        f1 = [];
        f2 = (fstart:fstep2:fstop)';
    else
        f1 = (fstart:fstep1:fstop1)';
        f2 = (fstart2:fstep2:fstop)';
    end
    f_data = unique([f1; f2; fstop]);
end



% --------- EVALUATION ----------------------------------------------------

oETH.write('TRAC? TRACE1; *WAI');
rawdata_string = oETH.read;         % Warings appears. "Input buffer was filled befor the Terminator was reached."
                                    % Therefor the red data is cut of to 512 entries instead of 32335

rawdata = sscanf(rawdata_string, '%e,');
NData	= length(rawdata);


% --------- compare frequency- and datavector -----------------------------

Nf = length(f_data);

if Nf ~= NData
    warning('frequency- and datavector not equal');
end

% --------- plot ----------------------------------------------------------

handleFigure                = figure;
handleFigure.Position       = [13,82,1348,709];
handleAxes1                 = subplot(3,1,1);
handlePlot1                 = plot(handleAxes1, f_data /1e6, rawdata);
handleAxes1.XLabel.String	= 'f/MHz';               % Lables x-axis
handleAxes1.YLabel.String	= 'raw data/dBuV';       % Lables y-axis
handleAxes1.XLim            = (f_data([1, end]) / 1e6);       % XLim sets the value range of the x-axis


[f_AF, AF3m, AF10m, f_att, att] = loadCorrectedData_implementedJustForTesting();

att_fdata     = interp1(f_att, att, f_data);
AF3m_fdata    = interp1(f_AF(f_AF <= 1e9), AF3m (f_AF <= 1e9), f_data);
AF10m_fdata   = interp1(f_AF(f_AF <= 1e9), AF10m(f_AF <= 1e9), f_data);

FB1limit	  = -7.9131 * log10(f_att) + 101.1672;

data_dBuV     = rawdata + att_fdata + AF3m_fdata;

handleAxes2                 = subplot(3, 1, 2:3);
handlePlot2                 = plot(handleAxes2, (f_data / 1e6), data_dBuV);  %before: semilogx
handleAxes2.XScale          = 'log';
handleAxes2.XLabel.String	= 'f/MHz';
handleAxes2.YLabel.String	= 'U/(dBuV/m)';

