% ====================================================
%> @brief measure the current on a specified or the active output.
%>
%> @param obj Instance of class
%> @param varargin 'P6V' || 'P25V' || 'N25V' to select an output, or nothing to use the currently active output
%> 
%> @return i measured current in Ampere
% =====================================================

function i = getAmpsMeasured(obj, varargin)
    if ~isempty(varargin)
        source = varargin{1};
        obj.write("MEAS:CURR? " + source + ";*WAI;");
    else
        obj.write("MEAS:CURR?" + ";*WAI;");
    end
    pause(0.1);
    message = obj.read;
    i = str2double(message);
    if isnan(i)
        disp(message);
        error("bad message from device");
    end
end

