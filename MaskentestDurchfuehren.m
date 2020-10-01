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
% =====================================================

function output = MaskentestDurchfuehren(SignalGen,Oscilloscope,freq,Vpp_Rect,SigIn,SyncIn,AnzahlDatenPunkte,Auswertung,varargin)
%% Benötigte Variablen
% Channelnummer aus Channelstring extrahieren
Input_channel_nr = str2double(extractAfter(SigIn,"CH"));
Sync_channel_nr = str2double(extractAfter(SyncIn,"CH"));
% Amplitudenvektor definieren
AmpVector = logspace(log10((Vpp_Rect/2)-0.2),log10((Vpp_Rect/2)-0.001),AnzahlDatenPunkte);

% Datenvektor definieren
LengthAmpVector = length(AmpVector);
DataVector = zeros(2,LengthAmpVector);

%% Signalgeneratoreinstellungen
disp("Signalgenerator wird konfiguriert");
% Signaltyp und Anfangswerte definieren
% 1.Typ    = Rechteck
% 1.Freq.  = 1kHz
% 1.Ampl.  = Anfangsamplitude in VPP
% 1.Offset = 0V
% 1.Phase  = 0°
% 2.Typ    = Rauschen
% 2.Ampl.  = 2Vpp
% 2.Offset = 0V
setSourceSquare(SignalGen,1,freq,Vpp_Rect,Vpp_Rect/2,0);
write(SignalGen,":SOUR2:APPL:NOIS 2,0");

disp("Konfiguration des Signalgenerators abgeschlossen");

%% Oszilloskop Kanaleinstellungen
disp("Oszilloskopkanäle werden konfiguriert");
% Benötigte Channel einschalten
EnableDisableChannel(Oscilloscope,Input_channel_nr,"on");
EnableDisableChannel(Oscilloscope,Sync_channel_nr,"on");
% Kopplung der Kanäle auf DC 50Ohm stellen
setChannelCoupling(Oscilloscope,Input_channel_nr,"DC");
setChannelCoupling(Oscilloscope,Sync_channel_nr,"DC");
% Tastkopfeinheit auf Volt stellen
setPassiveProbeMeasuringUnit(Oscilloscope,Input_channel_nr,"V");
setPassiveProbeMeasuringUnit(Oscilloscope,Sync_channel_nr,"V");
% Tastkopfdämpfung auf 1:1 stellen
setPassiveProbeAttenuation(Oscilloscope,Input_channel_nr,1);
setPassiveProbeAttenuation(Oscilloscope,Sync_channel_nr,1);
% Vertikalen Offset auf 0 setzen
setChannelOffset(Oscilloscope,Input_channel_nr,0);
setChannelOffset(Oscilloscope,Sync_channel_nr,0);
% Channelpolarität auf Normal setzen
setChannelPolarity(Oscilloscope,Input_channel_nr,"NORM");
setChannelPolarity(Oscilloscope,Sync_channel_nr,"NORM");
% Channel Deskew time auf 0 setzen
setChannelDeskew(Oscilloscope,Input_channel_nr,0);
setChannelDeskew(Oscilloscope,Sync_channel_nr,0);
% Channel ZOffset auf 0 setzen
setChannelZOffset(Oscilloscope,Input_channel_nr,0);
setChannelZOffset(Oscilloscope,Sync_channel_nr,0);
% Vertikale Skalierung anpassen
setVerticalScale(Oscilloscope,Input_channel_nr,115E-3);
setVerticalScale(Oscilloscope,Sync_channel_nr,1); %%Sync Signal 3,3Vpp ?
% Horzontale Skalierung anpassen
setHorizontalScale(Oscilloscope,50E-6);

disp("Konfiguration der Oszilloskopkanäle abgeschlossen");

%% Oszilloskop Erfassungseinstellungen
disp("Oszilloskop Erfassungseinstellungen werden konfiguriert");

% Anzahl der aufzunehmenden Samples definieren
write(Oscilloscope,"ACQ:POIN "+80E6);
% Erfassungsmodus auf Sampling stellen
setAcquisitionType(Oscilloscope,"SAMP");
% Erfassungsarithmetik ausschalten
setAcquisitionArithmetic(Oscilloscope,"OFF");

disp("Konfiguration der Oszilloskop Erfassungseinstellungen abgeschlossen");

%% Oszilloskop Triggereinstellungen
disp("Oszilloskop Triggereinstellungen werden konfiguriert");

% Triggermodus auf Automatisch setzen
setTriggerMode(Oscilloscope,"AUTO");
% Triggertyp auf Edgetrigger setzen
setTriggerType(Oscilloscope,"EDGE");
% Triggerquelle auf DUT-Eingangschannel setzen
setTriggerSource(Oscilloscope,"CH"+Sync_channel_nr);
% Triggerflanke auf auf steigende Flanke setzen
setEdgeTriggerSlope(Oscilloscope,"POS")
% Triggerschwelle auf 0V setzen
setTriggerThresholdVoltage(Oscilloscope,1,0);
% Triggerkopplung auf DC setzen
setEdgeTriggerCouplingMode(Oscilloscope,"DC");
% Trigger-Holdoff deaktivieren
setTriggerHoldoffMode(Oscilloscope,"OFF");
% Triggerposition eine Division vom rechten Bildschirmrand
setTriggerOffset(Oscilloscope,250E-6); 

disp("Konfiguration der Oszilloskop Triggereinstellungen abgeschlossen");

%% Maskentest konfigurieren
disp("Oszilloskop Maskentest wird konfiguriert");
% Maskentest einschalten
EnableDisableMaskingTest(Oscilloscope, "ON");
% Maskenquelle einstellen
setMaskTestSource(Oscilloscope, "CH"+Input_channel_nr);
% Bitfehlermaske laden
write(Oszi,'MMEM:CDIR "/INT/REFERENCE"');
write(Oszi,'MASK:LOAD "BER.MSK"');
% Maskenfehleraktion definieren
%   Deaktivieren: Sound,Screenshot,Save Waveformdata,Puls
%   Aktivieren: Stop
write(SignalGen,"MASK:ACT:SOUN:EVEN:MODE OFF");
write(SignalGen,"MASK:ACT:SCRS:EVEN:MODE OFF");
write(SignalGen,"MASK:ACT:WFMS:EVEN:MODE OFF");
write(SignalGen,"MASK:ACT:PULS:EVEN:MODE OFF");
write(SignalGen,"MASK:ACT:STOP:EVEN:MODE EACH");
% Anzahl Maskenverletzungen auf 100 stellen
write(SignalGen,"MASK:ACT:STOP:EVEN:COUN 100");
% Run Continous 
RunContinous(Oscilloscope);
% Erfassungsmodus auf Sampling stellen, da der Maskentest Envelope
% automatisch einstellt
setAcquisitionType(Oscilloscope,"SAMP");

disp("Konfiguration des Maskentests abgeschlossen");
%% Messdaten aufnehmen
for i = 1:1:LengthAmpVector
    % Amplitude einstellen
    setAmplitude(SignalGen,1,AmpVector(i));
    % Fehlerzähler zurücksetzen
    resetMaskCounter(Oscilloscope);
    % Run Continous da nach Maskenstopbedingung Erfassung beendet wird
    % Startet den nächsten Maskentest automatisch
    RunContinous(Oscilloscope);
    % Maskentest starten (Beim ersten Durchlauf)
    runMaskTest(Oscilloscope);
    % Maskenfehlersamples und Totalsamples auslesen
    DataVector(1,i) = getTotalMaskTestCount(Oscilloscope);
    DataVector(2,i) = getTotalFailedMaskTestCount(Oscilloscope);
    if i+1 > LengthAmpVector
        % Übergabe des Datenvektors und des Amplitudenvektors an die
        % Ausgabevariable
        output = {"Amplitudenvektor","TotalCountMaskTest","FailedCountMaskTest"; ...
            AmpVector,DataVector(1,:),DataVector(2,:)};
        break;
    end
    
    
end


%% Messdaten auswerten
if Auswertung == 1
    %N0 definieren
    % 0.1374 bei 2Vpp Rauschen
    % 0.4910 bei 4Vpp Rauschen
    N0 = 0.1374;
    %Amplitudenvektor in Leistungsvektor umrechnen
    PowerVector = (AmpVector ./2) .^2;
    
    %SNR-Vektor berechnen
    SNR_Vector = 10*log(PowerVector ./ N0);
    

end













end