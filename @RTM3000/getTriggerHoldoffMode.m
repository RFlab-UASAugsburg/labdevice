% ====================================================
%> @brief Gets the configured trigger holdoff time mode
%>
%> @param obj Instance of class
%>
%> @output triggerHoldoffMode Currently configured trigger holdoff mode
%>
% =====================================================


function triggerHoldoffMode = getTriggerHoldoffMode(obj)
write(obj,"*WAI; TRIG:A:HOLD:MODE?");
message = obj.read;
message = strip(message);
if isempty(message)
    error("no response from device");
end
triggerHoldoffMode = message;
end