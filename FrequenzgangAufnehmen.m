% ====================================================
%> @brief Frequencyresponse acquisition script (Sinus Sweep)
%> Operating principle:
%> 1. Signalgenerator gets configured
%> 2. Oscilloscope gets configured
%> 3. Sinusoid stimulus gets sent twice with coupled signalgen. outputs
%> -  One into the DUT
%> -  One into one of the oscilloscope channels
%> 4. For-loop over all frequency points
%> 5. Single acquisition at each frequency point
%> 6. Measuring the amplitude and phase of the DUT output signal with the
%>    acquisition stopped
%> 7. Saving the acquired data into a 2x1 data vector
%> 8. Every 5 measurements the vertical and horizontal scaling gets
%>    readjusted
%> Optional:
%> 9. Postprocessing of the acquired data in MATLAB
%> 10. Plotting the frequencyresponse curves into two subplots
%>
%> @param SignalGen Instance of class Rigol_DG4102
%>
%> @param Oszilloscope Selected channel RohdeUndSchwarz_RTM3000
%>
%> @param f_start Startfrequency for the sinusoid
%>
%> @param f_stop Stopfrequency for the sinusoid
%>
%> @param f_steps Number of evenly spaced frequencypoints between f_start
%>                and f_stop
%>        NOTE: USE ATLEAST 50 STEPS
%>
%> @param VPP_initial Peak-to-Peak Amplitude for the sinusoid signal
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
%> @output output 2x1 double array
%>         First row:  amplitude vector
%>         Second row: phase vector
% =====================================================


function output = FrequenzgangAufnehmen(SignalGen,Oszilloscope,f_start,f_stop,f_steps,VPP_initial,ChannelDUTInputSignal,ChannelDUTOutputSignal,Auswertung,varargin)
%% Benötigte Variablen
% Channelnummer aus Channelstring extrahieren
Input_channel_nr = str2double(extractAfter(ChannelDUTInputSignal,"CH"));
Output_channel_nr = str2double(extractAfter(ChannelDUTOutputSignal,"CH"));
% Frequenzvektor definieren
freq_vector = linspace(f_start,f_stop,f_steps);
% Rundung der Frequenzwerte, um glatteres Signal erzeugen zu können
round_freq = round(freq_vector,-3);
% Datenvektor definieren
data_vector = zeros(2,f_steps);
% Benötigte zusätzliche Variablen definieren
measurementCount = 0;
VertScaleMinReached = 0;

%% Signalgeneratoreinstellungen
disp("Signalgenerator wird konfiguriert");

% Channelkopplung der Signalgeneratorausgänge aktivieren
setSourceSinus(SignalGen,1,f_start,VPP_initial,0,0);
setSourceSinus(SignalGen,2,f_start,VPP_initial,0,0);
enableDisableChannelCoupling(SignalGen,"ON");
% Signaltyp und Anfangswerte definieren
% Freq.  = Startfrequenz
% Ampl.  = Anfangsamplitude
% Offset = 0
% Phase  = 0
setSourceSinus(SignalGen,1,f_start,VPP_initial,0,0);
setSourceSinus(SignalGen,2,f_start,VPP_initial,0,0);
disp("Konfiguration des Signalgenerators abgeschlossen");

%% Oszilloskop Kanaleinstellungen
disp("Oszilloskopkanäle werden konfiguriert");

% Benötigte Channel einschalten
enableDisableChannel(Oszilloscope,Input_channel_nr,"on");
enableDisableChannel(Oszilloscope,Output_channel_nr,"on");
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
setVerticalScale(Oszilloscope,Input_channel_nr,VPP_initial/5);
setVerticalScale(Oszilloscope,Output_channel_nr,VPP_initial/5);
pause(0.5);
% Horzontale Skalierung anpassen
HorzScal = 1/(freq_vector(1)*6);
setHorizontalScale(Oszilloscope,HorzScal);
pause(0.5);

disp("Konfiguration der Oszilloskopkanäle abgeschlossen");

%% Oszilloskop Messplatzeinstellungen
disp("Oszilloskop Messplätze werden konfiguriert");
% Messplätze einschalten
enableDisableQuickMeasurement(Oszilloscope,1,"ON");
enableDisableQuickMeasurement(Oszilloscope,2,"ON");
pause(0.5);
% Messungen einstellen
defineQuickMeasurementType(Oszilloscope,1,"PEAK");
defineQuickMeasurementType(Oszilloscope,2,"PHAS");
pause(0.5);
% Quellen der Messungen definieren
setQuickMeasurementSource(Oszilloscope,1,ChannelDUTOutputSignal);
setQuickMeasurementSource(Oszilloscope,2,ChannelDUTInputSignal,ChannelDUTOutputSignal);
pause(0.5);

disp("Konfiguration der Oszilloskop Messplätze abgeschlossen");

%% Oszilloskop Erfassungseinstellungen
disp("Oszilloskop Erfassungseinstellungen werden konfiguriert");

% Anzahl der aufzunehmenden Samples definieren
write(Oszilloscope,"ACQ:POIN "+80E6);
% Erfassungsmodus auf Sample stellen
setAcquisitionType(Oszilloscope,"SAMP");
% Erfassungsarithmetik ausschalten
setAcquisitionArithmetic(Oszilloscope,"OFF");

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
setEdgeTriggerSlope(Oszilloscope,"POS");
% Triggerschwelle auf Nulldurchgang setzen
setTriggerThresholdVoltage(Oszilloscope,1,0);
% Triggerkopplung auf DC setzen
setEdgeTriggerCouplingMode(Oszilloscope,"DC");
% Trigger-Holdoff deaktivieren
setTriggerHoldoffMode(Oszilloscope,"OFF");
% Triggerposition auf 0 setzen
setTriggerOffset(Oszilloscope,0);

disp("Konfiguration der Oszilloskop Triggereinstellungen abgeschlossen");

%% Messdaten aufnehmen
disp("Messdaten werden aufgenommen");

% Schleife über alle Frequenzpunkte
for i = 1:1:f_steps 
    runSingleAcquisition(Oszilloscope,1);
    % Messen und speichern der Amplitude
    data_vector(1,i) = getQuickMeasurementData(Oszilloscope,1); 
    % Messen und speichern der Phase
    data_vector(2,i) = getQuickMeasurementData(Oszilloscope,2);
    % Statusanzeiger
    disp(i+"/"+f_steps+" Done @ Ampl.: "+data_vector(1,i)+" Phase: "+data_vector(2,i));
    % Abbruchbedigung, wenn alle Frequenzpunkte durchlaufen sind
    if i+1 > f_steps
        % Übergabe des Datenvektors und des Frequenzvektors an die
        % Ausgabevariable
        output = {'Amplitudenvektor','Phasenvektor','Frequenzvektor';...
                    data_vector(1,:),data_vector(2,:),freq_vector};
        break;
    else
    % Nächsten Frequenzpunkt einstellen
    setFrequency(SignalGen,1,round_freq(i+1));
    end
% Anpassung der vert. und horz. Skalierung nach jeder 5. Messung
    if measurementCount >= 5
        VertScal = data_vector(1,i)/7;
        if VertScaleMinReached ~= 1
            if VertScal > 500E-6 
                setVerticalScale(Oszilloscope,Output_channel_nr,VertScal);
            else 
                setVerticalScale(Oszilloscope,Output_channel_nr,500E-6);
                VertScaleMinReached = 1;
            end
        end
        setHorizontalScale(Oszilloscope,1/(freq_vector(i)*6));
        measurementCount = 0;
    else
        measurementCount = measurementCount+1;
    end
    
end

disp("Messdatenaufnahme abgeschlossen");

%% Messdaten auswerten
if Auswertung == 1 
    disp("Messdaten werden ausgewertet");
    %Vpp in Amplitudenwert umrechnen und normieren
    sum3amps = data_vector(1,1)+data_vector(1,2)+data_vector(1,3);
    sum3ampsAVG = sum3amps/3;
    amp_vector = data_vector(1,:) ./ sum3ampsAVG;
    %Phasensprünge entfernen
    phase_vector = -180/pi .* (unwrap(pi/180 .* data_vector(2,:))); 
    
    % Subplot für den Amplitudengang
    subplot(2,1,1);
    semilogx(freq_vector,20*log10(amp_vector));
    %Frequenzskalierung
    try
        xlim([varargin{1},varargin{2}]);
    catch
        xlim([f_start,f_stop]);
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
    semilogx(freq_vector,phase_vector);
    %Frequenzskalierung
    try
        xlim([varargin{1},varargin{2}]);
    catch
        xlim([f_start,f_stop]);
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