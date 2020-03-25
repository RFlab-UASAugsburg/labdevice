% ====================================================
%> @brief Get the currently active output
%>
%> @param obj Instance of class
%>
%> @return output currently active output. 'P6V' || 'P25V' || 'N25V'
% =====================================================

function output = getOutput(obj)
	obj.write("INST?");
	output = obj.read;
end

