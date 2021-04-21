% ====================================================
%> @brief Gets the phase of the selected output
%>
%> @param obj Instance of class
%>
%> @param output Selected output
%>
%> @output phase Configured phase
%>
% =====================================================

function phase = getPhase(obj,output)
if (output == 1 || output == 2)
    write(obj,":SOUR"+output+":PHAS?");
    message = obj.read;
    message = strip(message);
    if isempty(message)
            error("no response from device");
    end
    phase = message; 
else
    error('Unknown output. Available outputs: 1 or 2');
end
    
end