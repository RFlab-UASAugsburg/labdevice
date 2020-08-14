% ====================================================
%> @brief Set the current limit for a specified or the active output.
%>
%> @param obj Instance of class
%> @param amps Current in Ampere
%> @param varargin 'P6V' || 'P25V' || 'N25V' to select an output, or nothing to use the currently active output
% =====================================================

function setAmps(obj, amps, varargin)
	if ~isempty(varargin)
	    source = varargin{1};
	    u = obj.getVoltsLimit(source);
	    obj.write("APPL " + source +", "+u+", " + amps);
	else
	    obj.write("CURR " + amps);
end

