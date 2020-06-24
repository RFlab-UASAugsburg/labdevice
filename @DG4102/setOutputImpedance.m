% ====================================================
%> @brief Set the Output impedance of a specific output
%>
%> @param obj Instance of class
%>
%> @param output Selected output 1 or 2
%>
%> @param imp Desired impedance (1 to 10kOhm)
%>
% =====================================================
function setOutputImpedance(obj, output, imp)
    if (output == 1 || output == 2)
        if (imp >= 1 && imp <= 10000)
            write(obj,":OUTP"+output+":IMP "+imp);
        else
            error('Output impedance out of bounds. Keep it between 1 and 10kOhm');
        end
    else
        error('Only output 1 or 2 are selectable');
    end


end
