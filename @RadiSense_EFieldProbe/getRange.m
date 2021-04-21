% ======================================================================
%> @brief returns the currently set measurement range
%>	1: 0 to 10V/m
%>	2: 10 to 30V/m
%>	3: 30 to 100V/m
%>	4: 100V/m to end of spec.
%>
%> @param obj Instance of RadiSense_EFieldProbe class
%>
%> @return ret measurement range from device
% ======================================================================
function ret = getRange(obj)
%   cycle to the next range, calculate the previously set range from the
%   returned value, set the range back to the original value and return it
ret = obj.setRange("N");
ret = obj.setRange(mod(ret-2,4)+1);
end