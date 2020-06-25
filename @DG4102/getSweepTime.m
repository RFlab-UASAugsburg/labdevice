% ====================================================
%> @brief Gets the sweep time of the selected output
%>
%> @param obj Instance of class
%>
%> @param output Selected output
%>
%> @output sweepTime Configured sweep time aka sweep duration
%>
% =====================================================

function sweepTime = getSweepTime(obj,output)
if (output == 1 || output == 2)
    write(obj,":SOUR"+output+":SWE:TIME?");
    message = obj.read;
    message = strip(message);
    if isempty(message)
            error("no response from device");
    end
    sweepTime = message; 
else
    error('Unknown output. Available outputs: 1 or 2');
end
    
end