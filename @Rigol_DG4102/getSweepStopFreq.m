% ====================================================
%> @brief Get sweep stop frequency
%>
%> @param obj Instance of class
%>
%> @param output Selected output
%>
%> @output sweepStopFreq Configured stop sweep frequency of the selected
%>  channel in [Hz]
% =====================================================

function sweepStopFreq = getSweepStopFreq(obj,output)
if (output == 1 || output == 2)
    write(obj,":SOUR"+output+":FREQ:STOP?");
    message = obj.read;
    message = strip(message);
    if isempty(message)
        error('No awnser from device');
    end
    sweepStopFreq = message;
    
else
    error('Unknown output. Available outputs: 1 or 2');
end

end