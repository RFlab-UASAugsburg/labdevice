% ====================================================
%> @brief Set the current limit for a specified or the active output.
%>
%> @param obj Instance of class
%> @param current Current in Ampere
%> @param varargin 'P6V' || 'P25V' || 'N25V' to select an output, or nothing to use the currently active output
% =====================================================

function setCurrent(obj, current, varargin)
	if ~isempty(varargin)
	    source = varargin{1};
	    u = obj.getVoltageLimit(source);
	    obj.write("APPL " + source +", "+u+", " + current);
	else
	    obj.write("CURR " + current);
end

