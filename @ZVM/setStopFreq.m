function setStopFreq(obj,freq)
%SETSTOPFREQ Set the stop frequency (in Hz)
%   Detailed explanation goes here
obj.write("FREQ:STOP " + freq);
end

