% ====================================================
%> @brief Set sweep stop frequency (Currently only for sinus sweeps)
%>
%> @param obj Instance of class
%>
%> @param output Selected output
%>
%> @param freq sweep start frequency
%>
% =====================================================

function setSweepStopFreq(obj,output,freq)
if (output == 1 || output == 2)
    if freq < 1E-6 || freq > 160E6
        error('Frequency out of bounds. Keep it between 1E-6 and 160E6');
    end
    write(obj,":SOUR"+output+":FREQ:STOP "+freq);
else
    error('Unknown output. Available outputs: 1 or 2');
end
    
end