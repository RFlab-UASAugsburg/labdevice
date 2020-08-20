% ====================================================
%> @brief Get the voltage limit for a specified or the active output.
%>
%> @param obj Instance of class
%> @param varargin 'P6V' || 'P25V' || 'N25V' to select an output, or nothing to use the currently active output
%> 
%> @return u current voltage limit in Volts
% =====================================================

function u = getVoltageLimit(obj, varargin)
    if ~isempty(varargin)
        source = varargin{1};
        obj.write("APPL? " + source + ";*WAI;");
        message = obj.read();
        message = erase(message,char(34));
        if isempty(message)
            error("no answer from device");
        end
        u = sscanf(message,"%e,");
        if length(u) ~= 2
            disp(u);
            error("bad message:" + newline + message + newline);
        end
        u = u(1);
    else
        obj.write("VOLT?"  + ";*WAI;")
        message = obj.read;
        u = str2double(message);
    end
    if isempty(u) || isnan(u)
        disp(message);
        error("bad message from device");
    end
end

