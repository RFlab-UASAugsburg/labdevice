function nullpos(obj)
%
% manually turn the antenna to the null position
% 
% Disables all fields in the motor so the platform can be easily turned by
% hand
%
% Parameters:
%	obj.prop:     labDevice Handle with properties
%                - mode
%                - address
%                - port
%                - prop.comm(unication)Handle (interface specific)
%
%   deg:         Angle in Degrees
%manuelle Nullpos Ausrichtung
obj.write("SOUR:DIG:DATA:BYTE 0, (@101)"); 
%% Manuelle Nullposition Ausrichtung 
obj.write("SOUR:DIG:DATA:BYTE 4, (@101)");   %All Windings off(leichtes Drehen)
a=msgbox('Antenne in Nullposition drehen !!','Antennenausrichtung');
waitfor(a);
obj.write("SOUR:DIG:DATA:BYTE 0, (@101)");   