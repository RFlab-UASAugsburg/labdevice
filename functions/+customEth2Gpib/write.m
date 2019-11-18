function ret = write(obj,txt)
%WRITE Summary of this function goes here
%   Detailed explanation goes here
ret = 1;
adapter = obj.prop.adapter;
if adapter.prop.currentGPIBAddress == obj.prop.gpibAddr
    adapter.write(txt);
else
    adapter.setGPIBAddr(obj.prop.gpibAddr);
    adapter.write(txt);

end

