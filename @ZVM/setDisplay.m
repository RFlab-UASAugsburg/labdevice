function setDisplay(obj,onoff)
%SETDISPLAY enable/disable display update during remote control
%   Detailed explanation goes here
obj.write("SYST:DISP:UPD " + upper(onoff));
end

