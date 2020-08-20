% ======================================================================
%> @brief set the start frequency
%>
%> @param obj Instance of RohdeUndSchwarz_ZVM class
%> @param freq in Hz
% ======================================================================
function setStartFreq(obj,freq)
	obj.write("FREQ:START " + freq);
end

