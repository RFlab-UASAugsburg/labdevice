% ====================================================
%> @brief Get the measured voltage for a specified or the active output.
%>
%> @param obj Instance of class
%> @param varargin 'P6V' || 'P25V' || 'N25V' to select an output, or nothing to use the currently active output
%> 
%> @return u measured Voltage in Volts
% =====================================================

function u = getVoltageMeasured(obj, varargin)
    if ~isempty(varargin)
        source = varargin{1};
        obj.write("MEAS:VOLT? " + source + ";*WAI;");
    else
        obj.write("MEAS:VOLT?" + ";*WAI;");
    end
    pause(0.1);
    message = obj.read;
    u = str2double(message);
    if isnan(u)
        disp(message);
        error("bad message from device");
    end
end

