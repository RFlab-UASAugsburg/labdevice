% ====================================================
%> @brief Sets the frequency coupling deviation
%>
%> @param obj Instance of class
%>
%> @param deviation Desired frequency deviation in [Hz]
%>
% =====================================================

function setFrequencyCouplingDeviation(obj,deviation)
if deviation < 1E-6 || deviation > 160E6
    error("Deviation is out of bounds. Keep it between 0µHz and 160Mhz");
else
    write(obj,":COUP:FREQ:DEV "+deviation);
end  
end