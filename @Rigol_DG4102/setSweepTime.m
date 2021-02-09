% ====================================================
%> @brief Sets the sweep time of the selected output
%>
%> @param obj Instance of class
%>
%> @param output Selected output
%>
%> @param time sweep time aka sweep duration in [s]
%>
% =====================================================

function setSweepTime(obj,output,time)
if (output == 1 || output == 2)
    if time < 1E-3 || time > 300
        error('Time out of bounds. Keep it between 1E-3 and 300');
    end
    write(obj,":SOUR"+output+":SWE:TIME "+time);
else
    error('Unknown output. Available outputs: 1 or 2');
end
    
end