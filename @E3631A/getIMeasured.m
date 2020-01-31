function i = getIMeasured(obj, varargin)
%SETVOLTAGE Summary of this function goes here
%   P6V:    6V rail
%   P25V:   25V rail
%   N25V:   -25V rail
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

