% ====================================================
%> @brief Sets the trigger level to 50% of the signal amplitude
%>
%> @param obj Instance of class
%>
% =====================================================

function setTriggerLevelHalfAmplitude(obj)
    write(obj,"TRIG:A:FIND");
end