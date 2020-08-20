% ======================================================================
%> @brief Read data from labdevice
%>
%> @param obj Instance of labDevice class
%>
%> @return ret Data read from device
% ======================================================================
function ret = read(obj)
	ret = readDev(obj);
return