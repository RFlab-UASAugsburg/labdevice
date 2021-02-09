% ====================================================
%> @brief Sets the offset of the basic waveform
%>
%> @param obj Instance of class
%>
%> @param output Selected output
%>
%> @param phase Desired offset in [V]
%>
% =====================================================

function setOffset(obj,output,offset)
    if (output == 1 || output == 2)
        write(obj,":SOUR"+output+":VOLT:OFFS "+offset);
    else
        error('Unknown output. Available outputs: 1 or 2');
    end

end