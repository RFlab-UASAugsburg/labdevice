% ====================================================
%> @brief Frequencyresponse acquisition script (FFT of Impulseresponse)
%> Since the stepresponse can vary the user has to adjust some parameters
%> by hand accordingly with the remote screen or at the device itself
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
%> @param Varargin Plot axis scaling values in order as follows:
%>        freq_lim_min,freq_lim_max,dB_lim_min,dB_lim_max,phase_lim_min,phase_lim_max
%>        1 & 2: x-axis frequency lower and upper limit
%>        3 & 4: y-axis gain/attenuation lower and upper limit
%>        5 & 6: y-axis phase lower and upper limit
%>        Default values when no value is assigned:
%>        1 & 2: start frequency and stop frequency of the frequency vector
%>        3 & 4: -50dB and 0dB
%>        5 & 6: -90°  and 0°
%> 
%> @output output 2x1 vector with the sampling frequency of the
%                 oscilloscope and the acquired math channel data
%>
% =====================================================

function output = FrequenzgangAufnehmenUeberSprungantwort(SignalGen,Oscilloscope,f_step,VPP_step,ChannelDUTInputSignal,ChannelDUTOutputSignal,Auswertung,varargin)
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
EnableDisableChannel(Oscilloscope,Input_channel_nr,"on");
EnableDisableChannel(Oscilloscope,Output_channel_nr,"on");
% Kopplung der Kanäle auf DC 50Ohm stellen
setChannelCoupling(Oscilloscope,Input_channel_nr,"DC");
setChannelCoupling(Oscilloscope,Output_channel_nr,"DC");
% Tastkopfeinheit auf Volt stellen
setPassiveProbeMeasuringUnit(Oscilloscope,Input_channel_nr,"V");
setPassiveProbeMeasuringUnit(Oscilloscope,Output_channel_nr,"V");
% Tastkopfdämpfung auf 1:1 stellen
setPassiveProbeAttenuation(Oscilloscope,Input_channel_nr,1);
setPassiveProbeAttenuation(Oscilloscope,Output_channel_nr,1);
% Vertikalen Offset auf 0 setzen
setChannelOffset(Oscilloscope,Input_channel_nr,0);
setChannelOffset(Oscilloscope,Output_channel_nr,0);
% Channelpolarität auf Normal setzen
setChannelPolarity(Oscilloscope,Input_channel_nr,"NORM");
setChannelPolarity(Oscilloscope,Output_channel_nr,"NORM");
% Channel Deskew time auf 0 setzen
setChannelDeskew(Oscilloscope,Input_channel_nr,0);
setChannelDeskew(Oscilloscope,Output_channel_nr,0);
% Channel ZOffset auf 0 setzen
setChannelZOffset(Oscilloscope,Input_channel_nr,0);
setChannelZOffset(Oscilloscope,Output_channel_nr,0);
% Vertikale Skalierung anpassen
setVerticalScale(Oscilloscope,Input_channel_nr,VPP_step/5);
setVerticalScale(Oscilloscope,Output_channel_nr,VPP_step/5);
% Horzontale Skalierung anpassen
HorzScal = 1/(24*f_step); % 1/f * 1/2 * 1/12
setHorizontalScale(Oscilloscope,HorzScal);
% Mannuelle Anpassung der vertikalen Skalierung der Sprungantwort
RunContinous(Oscilloscope);
disp('ANPASSEN DER POSITION UND VERTIKALEN SKALIERUNG DER SPRUNGANTWORT')
disp('1. Den Kanal der Sprungantwort des DUT rechts auswählen')
disp('2. Es sollte sich ein Tab öffnen, welches als fünften Eintrag von oben die "Vertical Scale" haben sollte')
disp('3. Diese über diesen Tab oder direkt über die Drehknöpfe am Gerät oder am Remote Screen demensprechend einstellen')
disp('3. Hierbei ist zubeachten, dass das Signal möglichst viel vom Bildschirm ausfüllt, ohne das das Signal clippt (d.h. außerhalb des Bildschirms liegt)')
disp('5. Um das Skript fortzusetzen mit dem Mauszeiger in das Matlab Command Window klicken und 1x Enter drücken')
pause;

disp("Konfiguration der Oszilloskopkanäle abgeschlossen");

%% Oszilloskop Erfassungseinstellungen
disp("Oszilloskop Erfassungseinstellungen werden konfiguriert");

% Anzahl der aufzunehmenden Samples definieren
write(Oscilloscope,"ACQ:POIN "+80E6);
% Erfassungsmodus auf High Resolution stellen
setAcquisitionType(Oscilloscope,"HRES");
% Erfassungsarithmetik auf Averaging stellen
setAcquisitionArithmetic(Oscilloscope,"AVER");
% Anzahl Samples pro Averaging auf 32 setzen
setAcquisitionArithmeticAveragingCount(Oscilloscope,32);

disp("Konfiguration der Oszilloskop Erfassungseinstellungen abgeschlossen");

%% Oszilloskop Triggereinstellungen
disp("Oszilloskop Triggereinstellungen werden konfiguriert");

% Triggermodus auf Automatisch setzen
setTriggerMode(Oscilloscope,"AUTO");
% Triggertyp auf Edgetrigger setzen
setTriggerType(Oscilloscope,"EDGE");
% Triggerquelle auf DUT-Eingangschannel setzen
setTriggerSource(Oscilloscope,"CH"+Input_channel_nr);
% Triggerflanke auf auf steigende Flanke setzen
setEdgeTriggerSlope(Oscilloscope,"POS")
% Triggerschwelle auf 1/4 der VPP des Eingangssprungs setzen
setTriggerThresholdVoltage(Oscilloscope,1,VPP_step/4);
% Triggerkopplung auf DC setzen
setEdgeTriggerCouplingMode(Oscilloscope,"DC");
% Trigger-Holdoff deaktivieren
setTriggerHoldoffMode(Oscilloscope,"OFF");
% Triggerposition an den linken Bildschirmrand setzen
setTriggerOffset(Oscilloscope,1/(4*f_step)); % 1/f * 1/4

disp("Konfiguration der Oszilloskop Triggereinstellungen abgeschlossen");

%% Oszilloskop Math-einstellungen
disp("Oszilloskop Mathchanneleinstellungen werden konfiguriert");
% Benötigten Mathematikkanal einschalten
EnableDisableMathChannel(Oscilloscope,1,"ON");
% Ableiten des DUT-Ausgangssignals
defineMathChannelOperation(Oscilloscope,1,"DERI","CH"+Output_channel_nr);
% Pausieren um die Anzahl der Samples pro dx einzustellen
disp('EINSTELLEN DES ABLEITUNGSSAMPLE ANZAHL')
disp('1. Auf dem Oszilloskopbildschirm auf den unten in der mitte angezeigten Math Kanal klicken')
disp('2. In dem sich öffnenden Reiter den Punkt "Menu" auswählen und die Math-Kanal Einstellungen sollten sich öffnen')
disp('3. Bei der ersten Gleichung, rechts neben "dx: XY Sa", auf den Knopf mit den 9 weißen Quadraten klicken')
disp('4. Die Zahl 32 eingeben und mit dem "Enter" Knopf bestätigen')
disp('5. Um das Skript fortzusetzen mit dem Mauszeiger in das Matlab Command Window klicken und 1x Enter drücken')
pause;
% Pausieren um die Position und vertikale Skalierung der Math-Waveform per
% Hand anzupassen
disp('ANPASSEN DER POSITION UND VERTIKALEN SKALIERUNG DER MATH-WAVEFORM')
disp('1. Möglicherweise überdeckt der "Equation Set Editor" die benötigten Felder. Diesen per Drag-and-Drop ein Stück nach unten schieben')
disp('2. Rechts unten sollten die zwei Felder "Position" und "Vertical Scale" nun sichtbar sein')
disp('3. Mit diesen die Position und vertikale Skalierung der Ableitung einstellen')
disp('3. Per Remote-Screen oder am direkt am Gerät auch über die Drehknöpfe einstellbar')
disp('4. Hierbei den Oszilloskopbildschirm bestmöglich ausnutzen und die vertikale Skalierung so klein wie möglich einstellen, ohne das das Signal clippt (außerhalb des Bildschirms ist)')
disp('5. Um das Skript fortzusetzen mit dem Mauszeiger in das Matlab Command Window klicken und 1x Enter drücken')
pause;
StopAcquisition(Oscilloscope);
disp("Konfiguration der Oszilloskop Mathchanneleinstellungen abgeschlossen");
%% Messdaten aufnehmen
% Single Acquisition mit definierter Anzahl an zu erfassenden Waveforms 
RunSingleAcquisition(Oscilloscope,320);
% Auslesen der Werte der Ableitungskurve
math_channel_data = getMathChannelData(Oscilloscope,1);
% Auslesen der Oszilloskop Samplingfrequency
SamplingFrequency = getSampleRate(Oscilloscope);
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
    %Frequenzskalierung
    try
        xlim([varargin{1},varargin{2}]);
    catch
        xlim([freq_vector(1),freq_vector(end)]);
    end
    %Verstärkung/Dämpfungsskalierung
    try
        ylim([varargin{3},varargin{4}]);
    catch
        ylim([-50,0]);
    end
    xlabel("Frequenz in Hz");
    ylabel("Amplitude in dB");
    title("Amplitudengang");
    
% Subplot für den Phasengang    
    subplot(2,1,2);
    semilogx(freq_vector,unwrap(angle(Math_channel_data_FFT(1:NFFT/2+1))))
    %Frequenzskalierung
    try
        xlim([varargin{1},varargin{2}]);
    catch
        xlim([freq_vector(1),freq_vector(end)]);
    end
    %Phasenskalierung
    try
        ylim([varargin{5},varargin{6}]);
    catch
        ylim([-90,0]);
    end
    xlabel("Frequenz in Hz");
    ylabel("Phase in Grad");
    title("Phasengang");
    
    sgtitle("Frequenzgang des Filters");

end