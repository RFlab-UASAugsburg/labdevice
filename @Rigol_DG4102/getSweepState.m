% ====================================================
%> @brief Get wether the output sweep is enabled or disabled
%>
%> @param obj Instance of class
%>
%> @param output Selected output
%>
%> @output sweepState Ouput sweep state, either 'ON' or 'OFF'
%>
% =====================================================

function sweepstate = getSweepState(obj,output)
if (output == 1 || output == 2)
    write(obj,":SOUR"+output+":SWE:STAT?");
    message = obj.read;
    message = strip(message);
            if isempty(message)
                error("no response from device");
            end
            
    sweepstate = message; 
else
    error('Unknown output. Available outputs: 1 or 2');
end
    
end