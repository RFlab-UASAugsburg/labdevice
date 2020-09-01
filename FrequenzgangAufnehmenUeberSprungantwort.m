

function output = FrequenzgangAufnehmenUeberSprungantwort(Gen,Oszi,f_step,VPP_step,ChannelDUTInputSignal,ChannelDUTOutputSignal,Auswertung)
%% Allgemeine Einstellungen
% Channelnummer aus Channelstring extrahieren
Input_channel_nr = str2double(extractAfter(ChannelDUTInputSignal,"CH"));
Output_channel_nr = str2double(extractAfter(ChannelDUTOutputSignal,"CH"));

%% Signalgeneratoreinstellungen
% Channelkopplung der Signalgeneratorausgänge aktivieren
EnableDisableChannelCoupling(Gen,"ON");
% Signaltyp und Anfangswerte definieren
% Freq.  = Startfrequenz
% Ampl.  = Anfangsamplitude in VPP
% Offset = Anfangsampl. * 1/2
% Phase  = 0
setSourceSquare(Gen,1,f_step,VPP_step,VPP_step/2,0);

%% Oszilloskop Kanaleinstellungen
% Benötigte Channel einschalten
EnableDisableChannel(Oszi,Input_channel_nr,"on");
EnableDisableChannel(Oszi,Output_channel_nr,"on");
pause(0.5);
% Kopplung der Kanäle auf DC 50Ohm stellen
setChannelCoupling(Oszi,Input_channel_nr,"DC");
setChannelCoupling(Oszi,Output_channel_nr,"DC");
pause(0.5);
% Tastkopfeinheit auf Volt stellen
setPassiveProbeMeasuringUnit(Oszi,Input_channel_nr,"V");
setPassiveProbeMeasuringUnit(Oszi,Output_channel_nr,"V");
pause(0.5);
% Tastkopfdämpfung auf 1:1 stellen
setPassiveProbeAttenuation(Oszi,Input_channel_nr,1);
setPassiveProbeAttenuation(Oszi,Output_channel_nr,1);
pause(0.5);
% Vertikalen Offset auf 0 setzen
setChannelOffset(Oszi,Input_channel_nr,0);
setChannelOffset(Oszi,Output_channel_nr,0);
pause(0.5);
% Channelpolarität auf Normal setzen
setChannelPolarity(Oszi,Input_channel_nr,"NORM");
setChannelPolarity(Oszi,Output_channel_nr,"NORM");
pause(0.5);
% Channel Deskew time auf 0 setzen
setChannelDeskew(Oszi,Input_channel_nr,0);
setChannelDeskew(Oszi,Output_channel_nr,0);
pause(0.5);
% Channel ZOffset auf 0 setzen
setChannelZOffset(Oszi,Input_channel_nr,0);
setChannelZOffset(Oszi,Output_channel_nr,0);
pause(0.5);
% Vertikale Skalierung anpassen
setVerticalScale(Oszi,Input_channel_nr,VPP_step/5);
setVerticalScale(Oszi,Output_channel_nr,VPP_step/5);
pause(0.5);
% Horzontale Skalierung anpassen
HorzScal = 1/(24*f_step); % 1/f * 1/2 * 1/12
setHorizontalScale(Oszi,HorzScal);
pause(2);

% Hier möglicherweise auch per-hand justierung von vert/horz scale falls
% nötig


%% Oszilloskop Erfassungseinstellungen
% Anzahl der aufzunehmenden Samples definieren
write(Oszi,"ACQ:POIN "+80E6);
% Erfassungsmodus auf High Resolution stellen
setAcquisitionType(Oszi,"HRES");
% Erfassungsarithmetik auf Averaging stellen
setAcquisitionArithmetic(Oszi,"AVER");
% Anzahl Samples pro Averaging auf 32 setzen
setAcquisitionArithmeticAveragingCount(Oszi,32);

%% Oszilloskop Triggereinstellungen
% Triggermodus auf Automatisch setzen
setTriggerMode(Oszi,"AUTO");
% Triggertyp auf Edgetrigger setzen
setTriggerType(Oszi,"EDGE");
% Triggerquelle auf DUT-Eingangschannel setzen
setTriggerSource(Oszi,"CH"+Input_channel_nr)
% Triggerflanke auf auf steigende Flanke setzen
setEdgeTriggerSlope(Oszi,"POS")
% Triggerschwelle auf 1/4 der VPP des Eingangssprungs setzen
setTriggerThresholdVoltage(Oszi,1,VPP_step/4)
% Triggerkopplung auf DC setzen
setEdgeTriggerCouplingMode(Oszi,"DC")
% Trigger-Holdoff deaktivieren
setTriggerHoldoffMode(Oszi,"OFF")

%% Oszilloskop Math-einstellungen
% Benötigten Mathematikkanal einschalten
EnableDisableMathChannel(Oszi,1,"ON");
% Ableiten des DUT-Ausgangssignals
defineMathChannelOperation(Oszi,1,DERI,"CH"+Output_channel_nr);
% Pausieren um die Anzahl der Samples pro dx einzustellen
pause;
disp('EINSTELLEN DES ABLEITUNGSSAMPLE ANZAHL')
disp('1. Auf dem Oszilloskopbildschirm auf den unten in der mitte angezeigten Math Kanal klicken')
disp('2. In dem sich öffnenden Reiter den Punkt "Menu" auswählen und die Math-Kanal Einstellungen sollten sich öffnen')
disp('3. Bei der ersten Gleichung, rechts neben "dx: XY Sa", auf den Knopf mit den 9 weißen Quadraten klicken')
disp('4. Die Zahl 32 eingeben und mit dem "Enter" Knopf bestätigen')
disp('5. Um das Skript fortzusetzen eine beliebige Taste in Matlab drücken')
% Pausieren um die Position und vertikale Skalierung der Math-Waveform per
% Hand anzupassen
pause;
RunContinous(Oszi);
disp('ANPASSEN DER POSITION UND VERTIKALEN SKALIERUNG DER MATH-WAVEFORM')
disp('1. Möglicherweise überdeckt der "Equation Set Editor" die benötigten Felder. Diesen per Drag-and-Drop ein Stück nach links oben schieben')
disp('2. Rechts unten sollten die zwei Felder "Position" und "Vertical Scale" nun sichtbar sein')
disp('3. Mit diesen die Position und vertikale Skalierung der Ableitung einstellen')
disp('3. Per Remote-Screen oder am direkt am Gerät auch über die Drehknöpfe einstellbar')
disp('4. Hierbei den Oszilloskopbildschirm bestmöglich ausnutzen und die vertikale Skalierung so klein wie möglich einstellen, ohne das das Signal clippt')
disp('5. Um das Skript fortzusetzen eine beliebige Taste in Matlab drücken')


%% Messdaten aufnehmen
    RunSingleAcquisition(Oszi,32);
    data_vector(1,i) = getQuickMeasurementData(Oszi,1); %Messen und speichern der Amplitude
    disp("Amp"+i+": "+data_vector(1,i))
    data_vector(2,i) = getQuickMeasurementData(Oszi,2); %Messen und speichern der Phase
    disp("Phase"+i+": "+data_vector(2,i))   


%% Messdaten auswerten
if Auswertung == 1 
 
    
    subplot(2,1,1);
    semilogx(freq_vector,20*log10(amp_vector));
    xlabel("Frequenz in [Hz]");
    ylabel("Amplitude in [dB]");
    title("Amplitudengang");
    
    subplot(2,1,2); 
    semilogx(freq_vector,phase_vector);
    xlabel("Frequenz in [Hz]");
    ylabel("Phase in [°]");
    title("Phasengang");
    
    sgtitle("Frequenzgang des Filters");

end