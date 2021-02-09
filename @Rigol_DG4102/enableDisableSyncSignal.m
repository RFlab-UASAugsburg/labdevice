% ====================================================
%> @brief Turns the sync signal of a specific output on or off
%>
%> @param obj Instance of class
%>
%> @param output Selected output
%>
%> @param state Desired sync signal state
%>
% =====================================================

function enableDisableSyncSignal(obj,output,state)
if (output == 1 || output == 2)
    state = upper(state);
    switch state
        case 'ON'
            write(obj,":OUTP"+output+":SYNC ON");
        case 'OFF'
            write(obj,":OUTP"+output+":SYNC OFF");
        otherwise
            error("Unclear state. Either 'ON' or 'OFF'");
    end
else
    error('Unknown output. Available outputs: 1 or 2');
end
    
end