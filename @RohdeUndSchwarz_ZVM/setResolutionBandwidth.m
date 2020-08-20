% ======================================================================
%> @brief set the IF/IF/resolution bandwidth
%>
%> @param obj Instance of RohdeUndSchwarz_ZVM class
%> @param bandwidth in Hz [double]
% ======================================================================
function setResolutionBandwidth(obj,bandwidth)
	obj.write("BWID:RES " + bandwidth + "Hz");
end

