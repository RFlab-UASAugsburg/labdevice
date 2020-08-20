% ======================================================================
%> @brief manually turn the antenna to the null position
%>
%> Disables all fields in the motor so the platform can be easily turned by
%> hand
%>
%> @param obj Instance of UASAugsburg_Stepper class
% ======================================================================
function nullpos(obj)
	%magic numbers \_(^.^)_/
	obj.write("SOUR:DIG:DATA:BYTE 0, (@101)"); 
	%% Manuelle Nullposition Ausrichtung 
	obj.write("SOUR:DIG:DATA:BYTE 4, (@101)");   %All Windings off(leichtes Drehen)
	a=msgbox('Antenne in Nullposition drehen !!','Antennenausrichtung');
	waitfor(a);
	obj.write("SOUR:DIG:DATA:BYTE 0, (@101)");
end