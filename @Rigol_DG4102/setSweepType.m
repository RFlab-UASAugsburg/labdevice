% ====================================================
%> @brief Sets the sweep type of the selected output
%>
%> @param obj Instance of class
%>
%> @param output Selected output
%>
%> @param mode Mode string to select a specific mode
%>  available mode strings: Linear =      'LIN'
%>                          Logarithmic = 'LOG'
%>                          Step =        'STE'
%>
% =====================================================

function setSweepType(obj,output,mode)
if (output == 1 || output == 2)
    modes = {'LIN','LOG','STE'};
    mode = upper(mode);
    if any(strcmp(modes,mode))
        write(obj,":SOUR"+output+":SWE:SPAC "+mode);
    else
        error("mode can only be" + string(join(modes)));
    end
else
    error('Unknown output. Available outputs: 1 or 2');
end
    
end