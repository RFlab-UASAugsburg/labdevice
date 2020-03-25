% ======================================================================
%> @brief enable/disable display update during remote control
%>
%> @param obj Instance of ZVM class
%> @param onoff 'on' or 'off'
% ======================================================================
function setDisplay(obj,onoff)
	obj.write("SYST:DISP:UPD " + upper(onoff));
end

