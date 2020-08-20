% ======================================================================
%> @brief set device to single sweep mode
%>
%> @param obj Instance of RohdeUndSchwarz_ZVM class
% ======================================================================
function singleSweep(obj)
	obj.write('INIT:CONT OFF');
end

