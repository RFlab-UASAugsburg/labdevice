function [ist_wert,deltaAngle,AngleVector]= messpunkte(~,stopp_pos,MeasPoints,Kreismessung)
% In dieser Funktion wird der Winkelvektor und den Reale Start-& Stoppwinkel
% berechnet
if MeasPoints==1% Wenn nur der Schrittmotor ausgeschalten ist oder nur an ein Punkt gemessen werden soll
    ist_wert=(round(stopp_pos/0.072))*0.072;
    AngleVector=linspace(-ist_wert,ist_wert,MeasPoints); % Berechnung des Winkelvektors
    deltaAngle=((AngleVector(end)-AngleVector(1))/(MeasPoints-1));% Berechnung der zu drehenden Winkel 
elseif Kreismessung==1% wenn eine 360° Messung durchgeführt werden soll
    ist_wert=stopp_pos;
    AngleVector=linspace(0,360,MeasPoints);% Berechnung des Winkelvektors
    deltaAngle=-360/(MeasPoints-1);% Berechnung der zu drehenden Winkel 
else
    ist_wert=round(stopp_pos/(MeasPoints-1)/0.072)*0.072*(MeasPoints-1);
    AngleVector=linspace(ist_wert,-ist_wert,MeasPoints); % Berechnung des Winkelvektors
    deltaAngle=((AngleVector(end)-AngleVector(1))/(MeasPoints-1));% Berechnung der zu drehenden Winkel 
end