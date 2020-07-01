% ====================================================
%> @brief Sets the trigger threshold voltage for edge, width, timeout trig.
%>
%> @param obj Instance of class
%>
%> @param trigger Selected trigger
%>  Note: 1 to 4 select the corresponding analog channels
%>        5 is the external trigger input
%>
%> @param level trigger threshold voltage in [V]
%>
% =====================================================

function setTriggerThresholdVoltage(obj,trigger,level)
    if trigger >= 1 && trigger <= 5
       if isnumeric(level)
           write(obj,"TRIG:A:LEV"+trigger+":VAL "+level);
       else
           error("Trigger level is not a number");
       end
    else
        error("Selected trigger has to be a number between 1 and 5");
    end
end