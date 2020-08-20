% ====================================================
%> @brief set the RohdeUndSchwarz_ESRP to single sweep mode
%>
%> @param obj Instance of class
% =====================================================
function singleSweep (obj)
	write(obj, ['INIT:CONT OFF; *WAI']);
	write(obj, ['INIT2:CONT OFF; *WAI']);
end