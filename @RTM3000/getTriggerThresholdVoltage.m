% ====================================================
%> @brief Gets the configured edge trigger slope
%>
%> @param obj Instance of class
%>
%> @param trigger Selected trigger
%>  Note: 1 to 4 select the corresponding analog channels
%>        5 is the external trigger input
%>
%> @output triggerThresholdVoltage Currently configured edge trigger slope
%>
% =====================================================


function triggerThresholdVoltage = getTriggerThresholdVoltage(obj, trigger)
if trigger >= 1 && trigger <= 5
    write(obj,"TRIG:A:LEV"+trigger+":VAL?");
    message = obj.read;
    message = strip(message);
    if isempty(message)
        error("no response from device");
    end
    
else
    error("Selected trigger has to be a number between 1 and 5");
end
triggerThresholdVoltage = message; 
end