% ====================================================
%> @brief enable/Disable source sweep for a specific output
%>
%> @param obj Instance of class
%>
%> @param output Selected output 1 or 2
%>
%> @param state Sweep state either ON or OFF
%>
% =====================================================
function enableDisableSourceSweep(obj, output, state)
        if (output == 1 || output == 2)
         state = upper(state);
         switch state
            case 'ON'
                write(obj,":SOUR"+output+":SWE:STAT ON");
            case 'OFF'
                write(obj,":SOUR"+output+":SWE:STAT OFF");
            otherwise
                error("Unclear state. Either 'ON' or 'OFF'");
         end
        else
          error('Unknown output. Only output 1 or 2 are selectable');
        end


end
