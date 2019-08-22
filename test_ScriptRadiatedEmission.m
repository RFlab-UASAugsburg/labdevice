%% Reading for the ESRP
%
%
%
%

if exist('connection', 'var')
    test_Initialize;	% establishing a connection
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

% --------- Rücklesen der eingestellten Werte -----------------------------

write(oETH, 'FREQ:START?;*WAI')
fstart = read(oETH);
write(oETH, 'SCAN1:STAR?;*WAI')
fstart1 = read(oETH);
write(oETH, 'SCAN2:STAR?;*WAI')
fstart2 = read(oETH);

write(oETH,'FREQ:STOP?;*WAI')
fstop = read(oETH);
write(oETH, 'SCAN1:STOP?;*WAI')
fstop1 = read(oETH);
write(oETH, 'SCAN2:STOP?;*WAI')
fstop2 = read(oETH);

write(oETH, 'SCAN1:STEP?;*WAI')
fstep1 = read(oETH);
write(oETH, 'SCAN2:STEP?;*WAI')
fstep2 = read(oETH);

% -------------------------------------------------------------------------

oETH.write('TRAC? TRACE1; *WAI');
rawdata_string = oETH.read;

rawdata = sscanf(rawdata_string, '%e,');
NData = length(rawdata);





