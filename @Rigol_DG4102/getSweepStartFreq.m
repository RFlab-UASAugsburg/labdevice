% ====================================================
%> @brief Get sweep start frequency
%>
%> @param obj Instance of class
%>
%> @param output Selected output
%>
%> @output sweepStartFreq Configured start sweep frequency of the selected
%>  channel in [Hz]
%>
% =====================================================

function sweepStartFreq = getSweepStartFreq(obj,output)
if (output == 1 || output == 2)
    write(obj,":SOUR"+output+":FREQ:STAR?");
    message = obj.read;
    message = strip(message);
    if isempty(message)
        error('No awnser from device');
    end
    sweepStartFreq = message;
    
else
    error('Unknown output. Available outputs: 1 or 2');
end

end