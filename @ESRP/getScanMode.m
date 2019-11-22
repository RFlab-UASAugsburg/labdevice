function mode = getScanMode(obj)
%GETSCANMODE Summary of this function goes here
%   Detailed explanation goes here
obj.write("FREQ:MODE?");
mode = obj.read;
mode = strip(mode);
end

