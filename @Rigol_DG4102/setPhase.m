% ====================================================
%> @brief Sets the phase of the basic waveform
%>
%> @param obj Instance of class
%>
%> @param output Selected output
%>
%> @param phase Desired phase in [Deg]
%> Note: Range from 0° to 360°
%>
% =====================================================

function setPhase(obj,output,phase)
if (output == 1 || output == 2)
    if phase < 0 || phase > 360
        error("Phase value out of bounds. Keep it between 0 and 360");
    else
        write(obj,":SOUR"+output+":PHAS "+phase);
    end
else
    error('Unknown output. Available outputs: 1 or 2');
end
    
end