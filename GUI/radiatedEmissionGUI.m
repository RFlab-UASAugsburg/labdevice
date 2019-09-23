function radiatedEmissionGUI(objESRP, detector, startFreq, stopFreq, measTime)
%
% Radiates Emission Measurement
%
% (long description goes here)
%
%
% Parameters:
%   connection
%
% Return values:
%   /
%
% See also:
%

addpath ../functions/.      % access 'functions'     folder
addpath ../correctedData/.  % access 'correctedData' folder

%% ----------- SETUP ------------------------------------------------------

objESRP.setDetector(detector);

objESRP.setStartFrequency(startFreq, 0);
objESRP.setStartFrequency(150e3, 1);
objESRP.setStartFrequency(30e6, 2);

objESRP.setStopFrequency(stopFreq, 0);
objESRP.setStopFrequency(30e6, 1);
objESRP.setStopFrequency(3e9, 2);

objESRP.setFreqStepSize(4e3, 1);
objESRP.setFreqStepSize(120e3, 2);

objESRP.setMeasBandwidth(9e3, 1);
objESRP.setMeasBandwidth(120e, 2);

objESRP.setMeasTime(200e-3, 1);
objESRP.setMeasTime(measTime, 2);

objESRP.setAttenuation(10, 1);
objESRP.setAttenuation(0, 2);

objESRP.setPreAmp('off', 1);
objESRP.setPreAmp('off', 2);


objESRP.actReceiverMode;
objESRP.setAutoBandwidth('off');
objESRP.singleSweep;
objESRP.setInputAttenuation('off');


%% --------- Measurement --------------------------------------------------

objESRP.singleSweep;

objESRP.startMeasurement;

pause(10); % workarround. Probably time violation. Otherwise errors appear.

%% ------------------------------------------------------------------------

% --------- Queries unit of y-Axis ----------------------------------------

objESRP.write('CALC:UNIT:POW?; *WAI');
unit = objESRP.read;

switch unit
    case 'DBUV'
        dataunit = 'dBuV';
    otherwise
        dataunit = 'unit unknown';
        error(['Wrong unit! (', unit, ')']);
end


% --------- Queries the set parameters ------------------------------------

write(objESRP, 'FREQ:START?; *WAI')
fstart = read(objESRP);
write(objESRP, 'SCAN1:STAR?; *WAI')
fstart1 = read(objESRP);
write(objESRP, 'SCAN2:STAR?; *WAI')
fstart2 = read(objESRP);

write(objESRP,  'FREQ:STOP?; *WAI')
fstop = read(objESRP);
write(objESRP, 'SCAN1:STOP?; *WAI')
fstop1 = read(objESRP);
write(objESRP, 'SCAN2:STOP?; *WAI')
fstop2 = read(objESRP);

write(objESRP, 'SCAN1:STEP?; *WAI')
fstep1 = read(objESRP);
write(objESRP, 'SCAN2:STEP?; *WAI')
fstep2 = read(objESRP);

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

objESRP.write('TRAC? TRACE1; *WAI');
rawdata_string = objESRP.read;         % Warings appears. "Input buffer was filled befor the Terminator was reached."
                                    % Therefor the red data is cut of to 512 entries instead of 32335

rawdata = sscanf(rawdata_string, '%e,');
NData	= length(rawdata);


% --------- compare frequency- and datavector -----------------------------

Nf = length(f_data);

if Nf ~= NData
    warning('frequency- and datavector not equal');
end

% --------- plot ----------------------------------------------------------


[f_AF, AF3m, AF10m, f_att, att] = loadCorrectedData_implementedJustForTesting();

att_fdata     = interp1(f_att, att, f_data);
AF3m_fdata    = interp1(f_AF(f_AF <= 1e9), AF3m (f_AF <= 1e9), f_data);
AF10m_fdata   = interp1(f_AF(f_AF <= 1e9), AF10m(f_AF <= 1e9), f_data);

FB1limit	  = -7.9131 * log10(f_att) + 101.1672;

data_dBuV     = rawdata + att_fdata + AF3m_fdata;

plot(app.Axes, (f_data / 1e6), data_dBuV);  %before: semilogx

end
