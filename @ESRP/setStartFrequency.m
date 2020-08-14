% ====================================================
%> @brief set the start frequency
%> 
%> set the start frequency of the whole measurement, or of a specified scan range
%> (in spectrum mode, no scan ranges are available)
%>
%> @param obj Instance of class
%> @param freq in Hz
%> @param varargin leave empty to set the start frequency of the whole measurement, [1..10] for a scan range
% =====================================================

function setStartFrequency(obj, freq, varargin)
	if ~isempty(varargin)
		if (varargin{1} < 1 || varargin{1} > 10)
	    	error('range is not correct (1 to 10)');
	    else
	    	write(obj, ['SCAN', num2str(varargin{1}), ':STAR ', num2str(freq), 'Hz; *WAI']);
        end
	else
		write(obj, ['FREQ:STAR ', num2str(freq), 'Hz; *WAI']);
	end
end