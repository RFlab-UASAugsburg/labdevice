% ======================================================================
%> @brief set the amount of measurement points in a sweep
%>
%> @param obj Instance of ZVM class
%> @param points amount of points
% ======================================================================
function setSweepPoints(obj,points)
	obj.write("SWE:POINTS " + points);
end

