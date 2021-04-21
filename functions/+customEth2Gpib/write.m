% ======================================================================
%> @brief write string to adapter
%>
%> @param obj Instance of labDevice class
%> @param txt string to be sent
%>
%> @return ret
% ======================================================================
function ret = write(obj,txt)
%WRITE Summary of this function goes here
%   Detailed explanation goes here
	ret = 1;
	adapter = obj.prop.adapter;
	if adapter.prop.currentGPIBAddress == obj.prop.gpibAddr
	    adapter.write(txt);
	else
	    adapter.setGPIBAddress(obj.prop.gpibAddr);
	    adapter.write(txt);
	ret = 0;
end

