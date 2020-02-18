function setMeasMode(obj,mode)
%SETFREQMODE Summary of this function goes here
%   Detailed explanation goes here
obj.write("SENS:FREQ:MODE " + mode);
end

