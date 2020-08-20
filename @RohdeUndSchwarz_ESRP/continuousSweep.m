% ====================================================
%> @brief set the measurement to continuous sweep mode
%>
%> @param obj Instance of class
% =====================================================

function continuousSweep (obj)
	obj.write("INIT2:CONT ON; *WAI");
	obj.write("INIT:CONT ON; *WAI");
end