function setGPIBAddress(obj,address)
%SETGPIBADDRESS Summary of this function goes here
%   Detailed explanation goes here
obj.write("++addr " + string(address));
obj.prop.currentGPIBAddress = address;
end

