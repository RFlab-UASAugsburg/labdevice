%% Reading for the ESRP
%
%
%
%

test_Initialize; % establishing a connection

%% ----------- OPEN THE CONNECTION ----------------------------------------

fopen(oETH)

%% ----------- SETUP ------------------------------------------------------

oETH.setDetector('qpeak');

oETH.setStartFrequency(30e6,0);
oETH.setStartFrequency(150e3,1);
oETH.setStartFrequency(30e6,2);

oETH.r_setStopFreq(1e9,0);
oETH.r_setStopFreq(30e6,1);
oETH.r_setStopFreq(3e9,2);

oETH.r_setIncr(4e3,1);
oETH.r_setIncr(120e3,2);

oETH.r_setZF(9e3,1);
oETH.r_setZF(120e3,2);

oETH.r_setMesTim(200e-3,1);
oETH.r_setMesTim(50e-3,2);

oETH.r_setAtten(10,1);
oETH.r_setAtten(0,2);

oETH.r_setPreAmp('off',1);
oETH.r_setPreAmp('off',2);


oETH.actRecMode;
oETH.setAutoBandw('off');
oETH.singlSweep;
oETH.setAtten('off');



% --------- Rücklesen der eingestellten Werte -----------------------------

    write(oETH, 'FREQ:START?;*WAI')
fstart = sscanf(fscanf(oETH, '%s'), '%d');
    write(oETH,'FREQ:STOP?;*WAI')
fstop = sscanf(fscanf(oETH, '%s'), '%d');
    write(oETH, 'SCAN1:STAR?;*WAI')
fstart1 = sscanf(fscanf(oETH, '%s'), '%f');
    write(oETH, 'SCAN2:STAR?;*WAI')
fstart2 = sscanf(fscanf(oETH, '%s'), '%f');
    write(oETH, 'SCAN1:STOP?;*WAI')
fstop1 = sscanf(fscanf(oETH, '%s'), '%f');
    write(oETH, 'SCAN2:STOP?;*WAI')
fstop2 = sscanf(fscanf(oETH, '%s'), '%f');
    write(oETH, 'SCAN1:STEP?;*WAI')
fstep1 = sscanf(fscanf(oETH, '%s'), '%f');
    write(oETH, 'SCAN2:STEP?;*WAI')
fstep2 = sscanf(fscanf(oETH, '%s'), '%f');



