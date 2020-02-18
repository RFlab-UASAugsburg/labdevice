function setStartFreq(obj,freq)
%SETSTARTFREQ Set the start frequency (in Hz)
%   Detailed explanation goes here
obj.write("FREQ:START " + freq);
end

