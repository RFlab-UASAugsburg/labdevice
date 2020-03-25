% ====================================================
%> @brief abort the measurement in progess
%>
%> @param obj Instance of class
% =====================================================

function abortMeas (obj)
	write(obj, ['ABOR; *WAI']);
end