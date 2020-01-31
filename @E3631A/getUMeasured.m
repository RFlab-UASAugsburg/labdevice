function u = getUMeasured(obj, varargin)
%SETVOLTAGE Summary of this function goes here
%   P6V:    6V rail
%   P25V:   25V rail
%   N25V:   -25V rail
    if ~isempty(varargin)
        source = varargin{1};
        obj.write("MEAS:VOLT? " + source + ";*WAI;");
    else
        obj.write("MEAS:VOLT?" + ";*WAI;");
    end
    message = obj.read;
    u = str2double(message);
    if isnan(u)
        disp(message);
        error("bad message from device");
    end
end

