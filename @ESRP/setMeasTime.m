% ====================================================
%> @brief set the measurement time
%> 
%> Defines the measurement time per point (frequency).
%> Default is: 50e-3 [s]

%> @param obj Instance of class
%> @param mesTim measuring time in seconds
%> @param range specify a scan range index [1..10]
%>
%> @return time in seconds
% =====================================================

function setMeasTime(obj, mesTim, range)
	if (range < 1 || range > 10)
		error('Range is not correct (1 to 10)');
	else
	    write(obj, ['SCAN', num2str(range), ':TIME ', num2str(mesTim), '; *WAI']);
	end
end