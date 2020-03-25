% ====================================================
%> @brief set the currently active output for programming
%>
%> @param obj Instance of class
%> @param output to be programmed. 'P6V' || 'P25V' || 'N25V'
% =====================================================

function setOutput(obj, output)
	obj.write("INST " + output);
end

