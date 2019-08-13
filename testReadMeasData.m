%% Skript zum auslesen von empfangenen Daten
%
% dieses Skript ist testweise nur mit einer ethernet Verbindung zum
% Messempfänger möglich.
%
%

testFunc; % establishing a connection

% ----------- SETUP -------------------------------------------------------

oETH.setDetector('qpeak');

oETH.r_setStartFreq(30e6,0);
oETH.r_setStartFreq(150e3,1);
oETH.r_setStartFreq(30e6,2);

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



% --------- Überprüfung des Frequenzbereiches -----------------------------

if (fstart < fstart1) || ( fstop > fstop2)
    error('Frequenzbereich fehlerhaft.');
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



