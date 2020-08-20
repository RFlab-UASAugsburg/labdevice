% ======================================================================
%> @brief set the stop frequency
%>
%> @param obj Instance of RohdeUndSchwarz_ZVM class
%> @param freq in Hz
% ======================================================================
function setStopFreq(obj,freq)
	obj.write("FREQ:STOP " + freq);
end
