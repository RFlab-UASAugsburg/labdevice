% ====================================================
%> @brief Sets the phase coupling deviation
%>
%> @param obj Instance of class
%>
%> @param deviation Desired phase deviation in [Deg]
%>
% =====================================================

function setPhaseCouplingDeviation(obj,deviation)
if deviation < 0 || deviation > 360
    error("Deviation is out of bounds. Keep it between 0° and 360°");
else
    write(obj,":COUP:PHAS:DEV "+deviation);
end  
end