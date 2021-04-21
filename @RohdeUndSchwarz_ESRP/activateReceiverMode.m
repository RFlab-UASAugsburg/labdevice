% ====================================================
%> @brief activate the Receiver Mode
%>
%> @param obj Instance of class
% =====================================================

function activateReceiverMode (obj)
	write(obj, ['INST REC; *WAI']);
end