function setGPIBAddress(obj,address)
%SETGPIBADDRESS set the gpib address of the device the prologic is
%currently communicating with
%   used to reduce overhead so we don't have to send the ++addr string with
%   every message
obj.write("++addr " + string(address));
obj.prop.currentGPIBAddress = address;
end

