% ====================================================
%> @brief Gets the amplitude of the selected output
%>
%> @param obj Instance of class
%>
%> @param output Selected output
%>
%> @output amplitude Configured amplitude
%>
% =====================================================

function amplitude = getAmplitude(obj,output)
if (output == 1 || output == 2)
    write(obj,":SOUR"+output+":VOLT?");
    message = obj.read;
    message = strip(message);
    if isempty(message)
            error("no response from device");
    end
    amplitude = message; 
else
    error('Unknown output. Available outputs: 1 or 2');
end
    
end