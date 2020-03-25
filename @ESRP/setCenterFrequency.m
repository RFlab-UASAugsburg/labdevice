% ====================================================
%> @brief set the center frequency and optionally span
%>
%> only for spectrum mode!
%>
%> @param obj Instance of class
%> @param freq center Frequency either as double in Hz or as string with unit (e.g. "1 GHz")
%> @param varargin [optional] span either as double in Hz or as string with unit
% =====================================================


function setCenterFrequency(obj,freq,varargin)
	if ~isempty(varargin)
	    span = varargin{1};
	    obj.write("FREQ:CENT " + freq + ";SPAN " + span);
	else
	    obj.write("FREQ:CENT " + freq)
	end
end

