% ====================================================
%> @brief Get the current limit for a specified or the active output.
%>
%> @param obj Instance of class
%> @param varargin 'P6V' || 'P25V' || 'N25V' to select an output, or nothing to use the currently active output
%> 
%> @return i current current limit in Ampere
% =====================================================

function i = getAmpsLimit(obj, varargin)
    if ~isempty(varargin)
        source = varargin{1};
        obj.write("APPL? " + source + ";*WAI;");
        message = obj.read();
        message = erase(message,char(34));
        if isempty(message)
            error("no answer from device");
        end
        i = sscanf(message,"%e,");
        i = i(2);
    else
        obj.write("CURR?" + ";*WAI;")
        i = str2double(obj.read);
    end
    if isempty(i) || isnan(u)
        disp(message);
        error("bad message from device");
    end
end

