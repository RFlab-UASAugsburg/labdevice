% ======================================================================
%> @brief get the amount of measurement points in a sweep
%>
%> @param obj Instance of RohdeUndSchwarz_ZVM class
%>
%> @return points number of sweep points [double]
% ======================================================================
function points = getSweepPoints(obj)
	obj.write('SWE:POINTS?');
	points = str2double(obj.read());
end

