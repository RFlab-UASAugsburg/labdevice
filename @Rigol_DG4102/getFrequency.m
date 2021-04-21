% ====================================================
%> @brief Gets the frequency of the selected output
%>
%> @param obj Instance of class
%>
%> @param output Selected output
%>
%> @output frequency Configured frequency
%>
% =====================================================

function frequency = getFrequency(obj,output)
if (output == 1 || output == 2)
    write(obj,":SOUR"+output+":FREQ?");
    message = obj.read;
    message = strip(message);
    if isempty(message)
            error("no response from device");
    end
    frequency = message; 
else
    error('Unknown output. Available outputs: 1 or 2');
end
    
end