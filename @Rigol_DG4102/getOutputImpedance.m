% ====================================================
%> @brief Get the output impedance of a specific output
%>
%> @param obj Instance of class
%>
%> @param output Selected output 1 or 2
%>
%> @output OutputImp Configured output impedance of the selected output
%>         Note: HighZ is returned as 'INFINITY'
%>               Regular impedance values e.g. 50Ohm as real numbers
% =====================================================
function OutputImp = getOutputImpedance(obj, output)
    if (output == 1 || output == 2)
        write(obj,":OUTP"+output+":LOAD?");
        message = obj.read;
        %message = strip(message);
        if isempty(message)
            error("no response from device");
        end
        OutputImp = message;
    else
        error('Only output 1 or 2 are selectable');
    end

end
