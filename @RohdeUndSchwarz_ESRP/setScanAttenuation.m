% ====================================================
%> @brief set the input attenuation for a scan range
%>
%> @param obj Instance of class
%> @param value Attenuation in dB
%> @param range range index [1..10]
% =====================================================

function setScanAttenuation(obj, value, range)
	if (range < 1 || range > 10)
		error('Range is not correct. (1 to 10)');
	else
	    write(obj, ['SCAN', num2str(range), ':INP:ATT ', num2str(value), 'dB; *WAI']);
	end
end