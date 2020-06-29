% ====================================================
%> @brief Get wether the output sync signal is enabled or disabled
%>
%> @param obj Instance of class
%>
%> @param output Selected output
%>
%> @output outputSyncState Ouput sweep state, either 'ON' or 'OFF'
%>
% =====================================================

function outputSyncState = getOutputSyncState(obj,output)
if (output == 1 || output == 2)
    write(obj,":OUTP"+output+":SYNC?");
    message = obj.read;
    message = strip(message);
            if isempty(message)
                error("no response from device");
            end
            
    outputSyncState = message; 
else
    error('Unknown output. Available outputs: 1 or 2');
end
    
end