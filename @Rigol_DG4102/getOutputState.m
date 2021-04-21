% ====================================================
%> @brief Get the output state('ON','OFF') of a specific output
%>
%> @param obj Instance of class
%>
%> @param output Selected output 1 or 2
%>
%> @output CurrentOutputState Current output state of the selected output
% =====================================================
function CurrentOutputState = getOutputState(obj, output)
    obj.write(":OUTP" + output +"?");
    message = obj.read;
    message = strip(message);
    states = {'ON', 'OFF'};
    if ~any(strcmp(states,message))
        if isempty(message)
            error("no response from device");
        else
            fprintf(message);
            error("bad message from device");
            
        end
    else
        CurrentOutputState = message;
    end
end

