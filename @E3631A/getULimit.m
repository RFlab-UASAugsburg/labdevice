function u = getULimit(obj, varargin)
%SETVOLTAGE Summary of this function goes here
%   P6V:    6V rail
%   P25V:   25V rail
%   N25V:   -25V rail
    if ~isempty(varargin)
        source = varargin{1};
        obj.write("APPL? " + source + ";*WAI;");
        message = obj.read();
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
    if isempty(u)
        disp(message);
        error("bad message from device");
    end
end

