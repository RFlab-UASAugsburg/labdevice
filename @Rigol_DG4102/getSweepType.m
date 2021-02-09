% ====================================================
%> @brief Gets the sweep type of the selected output
%>
%> @param obj Instance of class
%>
%> @param output Selected output
%>
% =====================================================


function sweepType = getSweepType(obj,output)
if (output == 1 || output == 2)
    write(obj,":SOUR"+output+":SWE:SPAC?");
    message = obj.read;
    message = strip(message);
    if isempty(message)
            error("no response from device");
    end
    sweepType = message; 
else
    error('Unknown output. Available outputs: 1 or 2');
end
    
end