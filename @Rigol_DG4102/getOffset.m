% ====================================================
%> @brief Gets the offset of the selected output
%>
%> @param obj Instance of class
%>
%> @param output Selected output
%>
%> @output phase Configured offset
%>
% =====================================================

function offset = getOffset(obj,output)
if (output == 1 || output == 2)
    write(obj,":SOUR"+output+":VOLT:OFFS?");
    message = obj.read;
    message = strip(message);
    if isempty(message)
            error("no response from device");
    end
    offset = message; 
else
    error('Unknown output. Available outputs: 1 or 2');
end
    
end