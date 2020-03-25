% ======================================================================
%> @brief set the source power
%>
%> @param obj Instance of ZVM class
%> @param power in dBm
% ======================================================================
function setSourcePower(obj,power)
	obj.write("SOUR:POW " + power + "dBm");
end

