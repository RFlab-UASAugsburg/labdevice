% ======================================================================
%> @brief set the gpib address of the device the prologic is currently communicating with
%>
%> used to reduce overhead so we don't have to send the ++addr string with
%> every message
%>
%> @param obj Instance of ProLogix_GPIB_ETHERNET class
%> @param address GPIB address
%>
%> @return ret
% ======================================================================
function setGPIBAddress(obj,address)
	obj.write("++addr " + string(address));
	obj.prop.currentGPIBAddress = address;
end

