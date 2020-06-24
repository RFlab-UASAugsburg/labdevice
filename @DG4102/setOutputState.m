% ====================================================
%> @brief Set the Output state of a specific output
%>
%> @param obj Instance of class
%> @param output Selected output 1 or 2
%> @param state Output state either ON or OFF
% =====================================================
function setOutputState(obj, output, state)
        if (output >= 1 & output <= 2)
         state = upper(state);
         switch state
            case 'ON'
                write(obj,":OUTP" + output + ":STAT ON");
            case 'OFF'
                write(obj,":OUTP" + output + ":STAT OFF");
            otherwise
                error('Unclear state. ' +state);
         end
        else
          error('Only output 1 or 2 are selectable');
        end


end

