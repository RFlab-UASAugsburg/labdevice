function i = getILimit(obj, varargin)
%SETVOLTAGE Summary of this function goes here
%   P6V:    6V rail
%   P25V:   25V rail
%   N25V:   -25V rail
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

