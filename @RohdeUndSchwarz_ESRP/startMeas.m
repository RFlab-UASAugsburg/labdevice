% ====================================================
%> @brief start a measurement immediately
%>
%> @param obj Instance of class
% =====================================================
function startMeas(obj)
	write(obj, ['INIT2:IMM; *WAI']);
end