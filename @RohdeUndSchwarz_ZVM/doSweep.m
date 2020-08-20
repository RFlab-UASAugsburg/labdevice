% ======================================================================
%> @brief do a single Sweep / immediately start a new measurement
%>
%> @param obj Instance of RohdeUndSchwarz_ZVM class
% ======================================================================
function doSweep(obj)
	obj.write('INIT:IMM;*WAI');
end
