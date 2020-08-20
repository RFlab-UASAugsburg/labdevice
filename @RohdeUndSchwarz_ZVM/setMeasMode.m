% ======================================================================
%> @brief set the measurement mode
%>
%> @param obj Instance of RohdeUndSchwarz_ZVM class
%> @param mode
% ======================================================================
function setMeasMode(obj,mode)
	obj.write("SENS:FREQ:MODE " + mode);
end
