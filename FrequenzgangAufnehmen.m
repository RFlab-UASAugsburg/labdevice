

function output = FrequenzgangAufnehmen(Gen,Oszi,f_start,f_stop,f_steps,VPP_initial,ChannelDUTInputSignal,ChannelDUTOutputSignal,Auswertung)
%% Allgemeine Einstellungen und Variablen
% Channelnummer aus Channelstring extrahieren
Input_channel_nr = str2double(extractAfter(ChannelDUTInputSignal,"CH"));
Output_channel_nr = str2double(extractAfter(ChannelDUTOutputSignal,"CH"));
% Frequenzvektor definieren
freq_vector = linspace(f_start,f_stop,f_steps);
% Datenvektor definieren
data_vector = zeros(2,f_steps);
% Benötigte zusätzliche Variablen definieren
count = 0;
VertMinReached = 0;

%% Signalgeneratoreinstellungen
% Channelkopplung der Signalgeneratorausgänge aktivieren
EnableDisableChannelCoupling(Gen,"ON");
% Signaltyp und Anfangswerte definieren
% Freq.  = Startfrequenz
% Ampl.  = Anfangsamplitude
% Offset = 0
% Phase  = 0
setSourceSinus(Gen,1,f_start,VPP_initial,0,0);

%% Oszilloskopeinstellungen
% Measurement Plätze einschalten
EnableDisableQuickMeasurement(Oszi,1,"ON");
EnableDisableQuickMeasurement(Oszi,2,"ON");
pause(0.5);
% Measurement Typen einstellen
defineQuickMeasurementType(Oszi,1,"PEAK");
defineQuickMeasurementType(Oszi,2,"PHAS");
pause(0.5);
% Measurement Quellen definieren
setQuickMeasurementSource(Oszi,1,ChannelDUTOutputSignal);
setQuickMeasurementSource(Oszi,2,ChannelDUTInputSignal,ChannelDUTOutputSignal);
pause(0.5);
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
setVerticalScale(Oszi,Input_channel_nr,VPP_initial/5);
setVerticalScale(Oszi,Output_channel_nr,VPP_initial/5);
pause(0.5);
% Horzontale Skalierung anpassen
HorzScal = 1/(freq_vector(1)*6);
setHorizontalScale(Oszi,HorzScal);
pause(2);

%% Messdaten aufnehmen
for i = 1:1:f_steps % Schleife über alle Frequenzpunkte
    RunSingleAcquisition(Oszi,1);
    data_vector(1,i) = getQuickMeasurementData(Oszi,1); %Messen und speichern der Amplitude
    disp("Amp"+i+": "+data_vector(1,i))
    data_vector(2,i) = getQuickMeasurementData(Oszi,2); %Messen und speichern der Phase
    disp("Phase"+i+": "+data_vector(2,i))
    if i+1 > f_steps %Abbruchbedigung wenn alle Frequenzpunkte durchlaufen sind
        output = {data_vector(1,:);data_vector(2,:)};
        break;
    else
        round_freq = round(freq_vector(i+1),-3);
        setFrequency(Gen,1,round_freq);
    end
% Anpassung der vert. und horz. Skalierung nach jeder 5. Messung
    if count >= 5
        VertScal = data_vector(1,i)/7;
        if VertMinReached ~= 1
            if VertScal > 500E-6 
                setVerticalScale(Oszi,Output_channel_nr,VertScal);
            else 
                setVerticalScale(Oszi,Output_channel_nr,500E-6);
                VertMinReached = 1;
            end
        end
        setHorizontalScale(Oszi,1/(freq_vector(i)*6));
        count = 0;
    else
        count = count+1;
    end
    
end

%% Messdaten auswerten
if Auswertung == 1 
    %Vpp in Amplitudenwert umrechnen
    amp_vector = 0.5 .* data_vector(1,:);
    %Phasensprünge entfernen
    phase_vector = -180/pi .* (unwrap(pi/180 .* data_vector(2,:))); 
    
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