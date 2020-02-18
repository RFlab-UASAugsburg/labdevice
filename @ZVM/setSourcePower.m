function setSourcePower(obj,power)
%SETSOURCEPOWER set the source power (in dBm)
%   Detailed explanation goes here
obj.write("SOUR:POW " + power + "dBm");
end

