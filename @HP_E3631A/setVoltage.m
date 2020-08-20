% ====================================================
%> @brief Set the voltage limit for a specified or the active output.
%>
%> @param obj Instance of class
%> @param voltage in Volts
%> @param varargin 'P6V' || 'P25V' || 'N25V' to select an output, or nothing to use the currently active output
% =====================================================


function setU(obj, voltage, varargin)
	if ~isempty(varargin)
	    source = varargin{1};
	    obj.write("APPL " + source +", "+voltage);
	else
	    obj.write("VOLT " + voltage);
end

