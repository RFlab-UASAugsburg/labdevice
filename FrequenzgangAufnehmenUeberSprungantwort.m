

function output = FrequenzgangAufnehmenUeberSprungantwort(Gen,Oszi,f_step,VPP_step,ChannelDUTInputSignal,ChannelDUTOutputSignal,Auswertung)
%% Allgemeine Einstellungen
% Channelnummer aus Channelstring extrahieren
Input_channel_nr = str2double(extractAfter(ChannelDUTInputSignal,"CH"));
Output_channel_nr = str2double(extractAfter(ChannelDUTOutputSignal,"CH"));

%% Signalgeneratoreinstellungen
disp("Signalgenerator wird konfiguriert");
% Channelkopplung der Signalgeneratorausgänge aktivieren
EnableDisableChannelCoupling(Gen,"ON");
% Signaltyp und Anfangswerte definieren
% Freq.  = Startfrequenz
% Ampl.  = Anfangsamplitude in VPP
% Offset = Anfangsampl. * 1/2
% Phase  = 0
setSourceSquare(Gen,1,f_step,VPP_step,VPP_step/2,0);
disp("Konfiguration des Signalgenerators abgeschlossen");

%% Oszilloskop Kanaleinstellungen
disp("Oszilloskopkanäle werden konfiguriert");
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
disp("Konfiguration der Oszilloskopkanäle abgeschlossen");

%% Oszilloskop Erfassungseinstellungen
disp("Oszilloskop Erfassungseinstellungen werden konfiguriert");
% Anzahl der aufzunehmenden Samples definieren
write(Oszi,"ACQ:POIN "+80E6);
% Erfassungsmodus auf High Resolution stellen
setAcquisitionType(Oszi,"HRES");
% Erfassungsarithmetik auf Averaging stellen
setAcquisitionArithmetic(Oszi,"AVER");
% Anzahl Samples pro Averaging auf 32 setzen
setAcquisitionArithmeticAveragingCount(Oszi,32);
disp("Konfiguration der Oszilloskop Erfassungseinstellungen abgeschlossen");
%% Oszilloskop Triggereinstellungen
disp("Oszilloskop Triggereinstellungen werden konfiguriert");
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
disp("Konfiguration der Oszilloskop Triggereinstellungen abgeschlossen");

%% Oszilloskop Math-einstellungen
disp("Oszilloskop Mathchanneleinstellungen werden konfiguriert");
% Benötigten Mathematikkanal einschalten
EnableDisableMathChannel(Oszi,1,"ON");
% Ableiten des DUT-Ausgangssignals
defineMathChannelOperation(Oszi,1,"DERI","CH"+Output_channel_nr);
% Pausieren um die Anzahl der Samples pro dx einzustellen
disp('EINSTELLEN DES ABLEITUNGSSAMPLE ANZAHL')
disp('1. Auf dem Oszilloskopbildschirm auf den unten in der mitte angezeigten Math Kanal klicken')
disp('2. In dem sich öffnenden Reiter den Punkt "Menu" auswählen und die Math-Kanal Einstellungen sollten sich öffnen')
disp('3. Bei der ersten Gleichung, rechts neben "dx: XY Sa", auf den Knopf mit den 9 weißen Quadraten klicken')
disp('4. Die Zahl 32 eingeben und mit dem "Enter" Knopf bestätigen')
disp('5. Um das Skript fortzusetzen eine beliebige Taste in Matlab drücken')
pause;
% Pausieren um die Position und vertikale Skalierung der Math-Waveform per
% Hand anzupassen
RunContinous(Oszi);
disp('ANPASSEN DER POSITION UND VERTIKALEN SKALIERUNG DER MATH-WAVEFORM')
disp('1. Möglicherweise überdeckt der "Equation Set Editor" die benötigten Felder. Diesen per Drag-and-Drop ein Stück nach links oben schieben')
disp('2. Rechts unten sollten die zwei Felder "Position" und "Vertical Scale" nun sichtbar sein')
disp('3. Mit diesen die Position und vertikale Skalierung der Ableitung einstellen')
disp('3. Per Remote-Screen oder am direkt am Gerät auch über die Drehknöpfe einstellbar')
disp('4. Hierbei den Oszilloskopbildschirm bestmöglich ausnutzen und die vertikale Skalierung so klein wie möglich einstellen, ohne das das Signal clippt')
disp('5. Um das Skript fortzusetzen eine beliebige Taste in Matlab drücken')
pause;
StopAcquisition(Oszi);
disp("Konfiguration der Oszilloskop Mathchanneleinstellungen abgeschlossen");
%% Messdaten aufnehmen
% Single Acquisition mit definierter Anzahl an zu erfassenden Waveforms 
RunSingleAcquisition(Oszi,320);
% Auslesen der Werte der Ableitungskurve
math_channel_data = getMathChannelData(Oszi,1);
% Auslesen der Oszilloskop Samplingrate
fs = getSampleRate(Oszi);
% Die ausgelesenen Werte an die Returnvariable übergeben
output = {math_channel_data;fs};
%% Messdaten auswerten
if Auswertung == 1
% Zero-Padding der Math-channel Daten, um 1E6 Nullen
    math_channel_data = [math_channel_data zeros(1,1000000)];
% Bestimmung der Länge des Datenvektors    
    L = length(math_channel_data);
% Bestimmung der Anzahl an FFT-Punkten    
    NFFT = 2^nextpow2(L);
% Berechung des Frequenzvekors        
    f = fs/2*linspace(0,1,NFFT/2+1);
% Berechung der FFT und Skalierung mit 1/(Länge Datenvektor)    
    Math_channel_data_FFT = fft(math_channel_data,NFFT)/L;
% Extraktion von der Amplitudenwerten aus dem komplexen FFT-Vektor
    abs_data = abs(Math_channel_data_FFT(1:NFFT/2+1));
% Normierung der Amplitudenwerte, sodass im Bodediagramm die ersten Werte bei 0dB beginnen     
    abs_data = abs_data ./ abs_data(1);
    
% Subplot für den Amplitudengang
    subplot(2,1,1);
    semilogx(f,20*log10(abs_data))
    xlim([1E6,50E6]);
    xlabel("Frequenz in [Hz]");
    ylabel("Amplitude in [dB]");
    title("Amplitudengang");
    
% Subplot für den Amplitudengang    
    subplot(2,1,2);
    semilogx(f,unwrap(angle(Math_channel_data_FFT(1:NFFT/2+1))))
    xlim([1E6,50E6]);
    xlabel("Frequenz in [Hz]");
    ylabel("Phase in [°]");
    title("Phasengang");
    
    sgtitle("Frequenzgang des Filters ");

end