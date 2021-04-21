% ====================================================
%> @brief Sets the amplitude coupling deviation
%>
%> @param obj Instance of class
%>
%> @param deviation Desired amplitude deviation in [Vpp]
%>
% =====================================================

function setAmplitudeCouplingDeviation(obj,deviation)
if deviation < 0 || deviation > 20
    error("Deviation is out of bounds. Keep it between 0 and 20");
else
    write(obj,":COUP:AMPL:DEV "+deviation);
end  
end