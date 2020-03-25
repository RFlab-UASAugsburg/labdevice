% ======================================================================
%> @brief set device to continuous sweep mode
%>
%> @param obj Instance of ZVM class
% ======================================================================
function continuousSweep(obj)
	obj.write('INIT:CONT ON');
end