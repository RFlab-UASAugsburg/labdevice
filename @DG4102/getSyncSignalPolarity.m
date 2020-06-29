% ====================================================
%> @brief Gets the sync signal polarity of a specific output
%>
%> @param obj Instance of class
%>
%> @param output Selected output
%>
% =====================================================


function syncSignalPolarity = getSyncSignalPolarity(obj,output)
if (output == 1 || output == 2)
    write(obj,":OUTP"+output+":SYNC:POL?");
    message = obj.read;
    message = strip(message);
    if isempty(message)
            error("no response from device");
    end
    syncSignalPolarity = message; 
else
    error('Unknown output. Available outputs: 1 or 2');
end
    
end