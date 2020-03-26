% ======================================================================
%> @brief close the java socket of a labDevice
%>
%> @param obj Instance of labDevice class
%> @return obj Instance of labDevice class
% ======================================================================
function obj = close(obj)
	obj.prop.commHandle.close;
	obj.prop.commHandle=[];
end
