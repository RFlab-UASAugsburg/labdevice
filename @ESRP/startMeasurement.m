% ====================================================
%> @brief start a measurement immediately
%>
%> @param obj Instance of class
% =====================================================
function startMeasurement(obj)
	write(obj, ['INIT2:IMM; *WAI']);t
end