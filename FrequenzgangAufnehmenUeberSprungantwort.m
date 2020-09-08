% ====================================================
%> @brief Frequencyresponse acquisition script (FFT of Impulseresponse)
%> Operating principle:
%> 1. Signalgenerator gets configured
%> 2. Oscilloscope gets configured
%> 3. Step signal stimulus gets sent twice with coupled signalgen. outputs
%> -  One into the DUT
%> -  One into one of the oscilloscope channels
%> 4. Step response from the DUT gets acquired and derived 
%> 5. Data from the derivative waveform gets exported into MATLAB 
%> Optional:
%> 6. Matlab performs the FFT from the acquired waveform data
%> 7. Plotting the frequencyresponse curves into two subplots
%> 
%> @param SignalGen Instance of class DG4102
%>
%> @param Oszilloscope Instance of class RTM3000
%>
%> @param f_step Frequency for the step signal
%>
%> @param VPP_step Amplitude Peak-to-Peak for the step signal
%>
%> @param ChannelDUTInputSignal Oscilloscope channel which has no DUT in
%>                              its signal path (e.G. "CH1")
%>
%> @param ChannelDUTOutputSignal Oscilloscope channel which has DUT in
%>                               its signal path (e.G. "CH2")
%>
%> @param Auswertung Selectable boolean whether or not the data is getting
%>                   postprocessed in MATLAB
%>
%> @param Plotsetting_xAxisLimMin X-Axis lower limit (for plotting)
%> 
%> @param Plotsetting_xAxisLimMax X-Axis upper limit (for plotting)
%> 
%> @output output 2x1 vector with the sampling frequency of the
%                 oscilloscope and the acquired math channel data
%>
% =====================================================

function output = FrequenzgangAufnehmenUeberSprungantwort(SignalGen,Oszilloscope,f_step,VPP_step,ChannelDUTInputSignal,ChannelDUTOutputSignal,Auswertung,Plotsetting_xAxisLimMin,Plotsetting_xAxisLimMax)
%% Benötigte Variablen
% Channelnummer aus Channelstring extrahieren
Input_channel_nr = str2double(extractAfter(ChannelDUTInputSignal,"CH"));
Output_channel_nr = str2double(extractAfter(ChannelDUTOutputSignal,"CH"));

%% Signalgeneratoreinstellungen
disp("Signalgenerator wird konfiguriert");
% Signaltyp einstellen bei welchem Kanalkopplung aktivierbar ist
setSourceSquare(SignalGen,1,f_step,VPP_step,VPP_step/2,0);
setSourceSquare(SignalGen,2,f_step,VPP_step,VPP_step/2,0);
% Channelkopplung der Signalgeneratorausgänge aktivieren
EnableDisableChannelCoupling(SignalGen,"ON");
% Signaltyp und Anfangswerte definieren
% Freq.  = Startfrequenz
% Ampl.  = Anfangsamplitude in VPP
% Offset = Anfangsampl. * 1/2
% Phase  = 0
setSourceSquare(SignalGen,1,f_step,VPP_step,VPP_step/2,0);
setSourceSquare(SignalGen,2,f_step,VPP_step,VPP_step/2,0);
disp("Konfiguration des Signalgenerators abgeschlossen");

%% Oszilloskop Kanaleinstellungen
disp("Oszilloskopkanäle werden konfiguriert");
% Benötigte Channel einschalten
EnableDisableChannel(Oszilloscope,Input_channel_nr,"on");
EnableDisableChannel(Oszilloscope,Output_channel_nr,"on");
pause(0.5);
% Kopplung der Kanäle auf DC 50Ohm stellen
setChannelCoupling(Oszilloscope,Input_channel_nr,"DC");
setChannelCoupling(Oszilloscope,Output_channel_nr,"DC");
pause(0.5);
% Tastkopfeinheit auf Volt stellen
setPassiveProbeMeasuringUnit(Oszilloscope,Input_channel_nr,"V");
setPassiveProbeMeasuringUnit(Oszilloscope,Output_channel_nr,"V");
pause(0.5);
% Tastkopfdämpfung auf 1:1 stellen
setPassiveProbeAttenuation(Oszilloscope,Input_channel_nr,1);
setPassiveProbeAttenuation(Oszilloscope,Output_channel_nr,1);
pause(0.5);
% Vertikalen Offset auf 0 setzen
setChannelOffset(Oszilloscope,Input_channel_nr,0);
setChannelOffset(Oszilloscope,Output_channel_nr,0);
pause(0.5);
% Channelpolarität auf Normal setzen
setChannelPolarity(Oszilloscope,Input_channel_nr,"NORM");
setChannelPolarity(Oszilloscope,Output_channel_nr,"NORM");
pause(0.5);
% Channel Deskew time auf 0 setzen
setChannelDeskew(Oszilloscope,Input_channel_nr,0);
setChannelDeskew(Oszilloscope,Output_channel_nr,0);
pause(0.5);
% Channel ZOffset auf 0 setzen
setChannelZOffset(Oszilloscope,Input_channel_nr,0);
setChannelZOffset(Oszilloscope,Output_channel_nr,0);
pause(0.5);
% Vertikale Skalierung anpassen
setVerticalScale(Oszilloscope,Input_channel_nr,VPP_step/5);
setVerticalScale(Oszilloscope,Output_channel_nr,VPP_step/5);
pause(0.5);
% Horzontale Skalierung anpassen
HorzScal = 1/(24*f_step); % 1/f * 1/2 * 1/12
setHorizontalScale(Oszilloscope,HorzScal);
pause(2);

% Hier möglicherweise auch per-hand justierung von vert/horz scale falls
% nötig
disp("Konfiguration der Oszilloskopkanäle abgeschlossen");

%% Oszilloskop Erfassungseinstellungen
disp("Oszilloskop Erfassungseinstellungen werden konfiguriert");

% Anzahl der aufzunehmenden Samples definieren
write(Oszilloscope,"ACQ:POIN "+80E6);
% Erfassungsmodus auf High Resolution stellen
setAcquisitionType(Oszilloscope,"HRES");
% Erfassungsarithmetik auf Averaging stellen
setAcquisitionArithmetic(Oszilloscope,"AVER");
% Anzahl Samples pro Averaging auf 32 setzen
setAcquisitionArithmeticAveragingCount(Oszilloscope,32);

disp("Konfiguration der Oszilloskop Erfassungseinstellungen abgeschlossen");

%% Oszilloskop Triggereinstellungen
disp("Oszilloskop Triggereinstellungen werden konfiguriert");

% Triggermodus auf Automatisch setzen
setTriggerMode(Oszilloscope,"AUTO");
% Triggertyp auf Edgetrigger setzen
setTriggerType(Oszilloscope,"EDGE");
% Triggerquelle auf DUT-Eingangschannel setzen
setTriggerSource(Oszilloscope,"CH"+Input_channel_nr);
% Triggerflanke auf auf steigende Flanke setzen
setEdgeTriggerSlope(Oszilloscope,"POS")
% Triggerschwelle auf 1/4 der VPP des Eingangssprungs setzen
setTriggerThresholdVoltage(Oszilloscope,1,VPP_step/4);
% Triggerkopplung auf DC setzen
setEdgeTriggerCouplingMode(Oszilloscope,"DC");
% Trigger-Holdoff deaktivieren
setTriggerHoldoffMode(Oszilloscope,"OFF");
% Triggerposition an den linken Bildschirmrand setzen
setTriggerOffset(Oszilloscope,1/(4*f_step)); % 1/f * 1/2

disp("Konfiguration der Oszilloskop Triggereinstellungen abgeschlossen");

%% Oszilloskop Math-einstellungen
disp("Oszilloskop Mathchanneleinstellungen werden konfiguriert");
% Benötigten Mathematikkanal einschalten
EnableDisableMathChannel(Oszilloscope,1,"ON");
% Ableiten des DUT-Ausgangssignals
defineMathChannelOperation(Oszilloscope,1,"DERI","CH"+Output_channel_nr);
% Pausieren um die Anzahl der Samples pro dx einzustellen
disp('EINSTELLEN DES ABLEITUNGSSAMPLE ANZAHL')
disp('1. Auf dem Oszilloskopbildschirm auf den unten in der mitte angezeigten Math Kanal klicken')
disp('2. In dem sich öffnenden Reiter den Punkt "Menu" auswählen und die Math-Kanal Einstellungen sollten sich öffnen')
disp('3. Bei der ersten Gleichung, rechts neben "dx: XY Sa", auf den Knopf mit den 9 weißen Quadraten klicken')
disp('4. Die Zahl 32 eingeben und mit dem "Enter" Knopf bestätigen')
disp('5. Um das Skript fortzusetzen mit dem Mauszeiger in das Matlab COmmand Window klicken und 1x Enter drücken')
pause;
% Pausieren um die Position und vertikale Skalierung der Math-Waveform per
% Hand anzupassen
RunContinous(Oszilloscope);
disp('ANPASSEN DER POSITION UND VERTIKALEN SKALIERUNG DER MATH-WAVEFORM')
disp('1. Möglicherweise überdeckt der "Equation Set Editor" die benötigten Felder. Diesen per Drag-and-Drop ein Stück nach unten schieben, sodass das ')
disp('2. Rechts unten sollten die zwei Felder "Position" und "Vertical Scale" nun sichtbar sein')
disp('3. Mit diesen die Position und vertikale Skalierung der Ableitung einstellen')
disp('3. Per Remote-Screen oder am direkt am Gerät auch über die Drehknöpfe einstellbar')
disp('4. Hierbei den Oszilloskopbildschirm bestmöglich ausnutzen und die vertikale Skalierung so klein wie möglich einstellen, ohne das das Signal clippt')
disp('5. Um das Skript fortzusetzen mit dem Mauszeiger in das Matlab COmmand Window klicken und 1x Enter drücken')
pause;
StopAcquisition(Oszilloscope);
disp("Konfiguration der Oszilloskop Mathchanneleinstellungen abgeschlossen");
%% Messdaten aufnehmen
% Single Acquisition mit definierter Anzahl an zu erfassenden Waveforms 
RunSingleAcquisition(Oszilloscope,320);
% Auslesen der Werte der Ableitungskurve
math_channel_data = getMathChannelData(Oszilloscope,1);
% Auslesen der Oszilloskop Samplingfrequency
SamplingFrequency = getSampleRate(Oszilloscope);
% Die ausgelesenen Werte an die Returnvariable übergeben
output = {"Mathchannel data","Samplingrate Fs";math_channel_data,SamplingFrequency};
%% Messdaten auswerten
if Auswertung == 1
% Zero-Padding der Math-channel Daten, um 1E6 Nullen
    math_channel_data = [math_channel_data zeros(1,1000000)];
% Bestimmung der Länge des Datenvektors    
    Length_Datavector = length(math_channel_data);
% Bestimmung der Anzahl an FFT-Punkten    
    NFFT = 2^nextpow2(Length_Datavector);
% Berechung des Frequenzvekors        
    freq_vector = SamplingFrequency/2*linspace(0,1,NFFT/2+1);
% Berechung der FFT und Skalierung mit 1/(Länge Datenvektor)    
    Math_channel_data_FFT = fft(math_channel_data,NFFT)/Length_Datavector;
% Extraktion von der Amplitudenwerten aus dem komplexen FFT-Vektor
    abs_data = abs(Math_channel_data_FFT(1:NFFT/2+1));
% Normierung der Amplitudenwerte, sodass im Bodediagramm die ersten Werte bei 0dB beginnen
    sum3amps = abs_data(1)+abs_data(2)+abs_data(3);
    sum3ampsAVG = sum3amps/3;
    abs_data = abs_data ./ sum3ampsAVG;
    
% Subplot für den Amplitudengang
    subplot(2,1,1);
    semilogx(freq_vector,20*log10(abs_data))
    xlim([Plotsetting_xAxisLimMin,Plotsetting_xAxisLimMax]);
    xlabel("Frequenz in [Hz]");
    ylabel("Amplitude in [dB]");
    title("Amplitudengang");
    
% Subplot für den Amplitudengang    
    subplot(2,1,2);
    semilogx(freq_vector,unwrap(angle(Math_channel_data_FFT(1:NFFT/2+1))))
    xlim([Plotsetting_xAxisLimMin,Plotsetting_xAxisLimMax]);
    xlabel("Frequenz in [Hz]");
    ylabel("Phase in [°]");
    title("Phasengang");
    
    sgtitle("Frequenzgang des Filters ");

end