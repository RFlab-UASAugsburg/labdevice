% ====================================================
%> @brief query the current scan mode. Only useful in receiver mode!
%>
%> @param obj Instance of class
%>
%> @return mode 'SCAN' || 'TDOM' || 'SWE'
% =====================================================

function mode = getScanMode(obj)
	obj.write("FREQ:MODE?");
	mode = obj.read;
	mode = strip(mode);
end

