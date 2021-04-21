% ======================================================================
%> @brief set the parameter to measure
%>
%> in frequency sweep mode, while measuring power
%>
%> @param obj Instance of RohdeUndSchwarz_ZVM class
%> @param param Measurement parameter, for example 'Z21' or 'S11'
% ======================================================================
function setMeasParameter(obj,param)
	obj.write("SENSE:FUNC 'XFR:POW:" + param + "'")
end
