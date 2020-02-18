function setZFBandwidth(obj,bandwidth)
%SETZFBANDWIDTH Set the ZF Bandwith (in Hz)
%   Detailed explanation goes here
obj.write("BWID:RES " + bandwidth + "Hz");
end

