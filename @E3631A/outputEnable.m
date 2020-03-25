% ====================================================
%> @brief Enable ALL outputs. 
%> 
%> Equivalent to pressing the Output on/off button on the front panel. 
%> To individually enable/disable outputs, instead set their current and voltage to zero
%>
%> @param obj Instance of class
% =====================================================

function outputEnable(obj)
    obj.write("OUTP ON");
end
