% ======================================================================
%> @brief set the IF/IF/resolution bandwidth
%>
%> @param obj Instance of ZVM class
%> @param bandwidth in Hz [double]
% ======================================================================
function setZFBandwidth(obj,bandwidth)
	obj.write("BWID:RES " + bandwidth + "Hz");
end

