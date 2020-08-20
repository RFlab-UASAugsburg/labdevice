% ====================================================
%> @brief continue the measurement at the frequency it was interrupted
%>
%> @param obj Instance of class
% =====================================================

function continueMeas(obj)
	write(obj, ['INIT2:CONM; *WAI']);
end