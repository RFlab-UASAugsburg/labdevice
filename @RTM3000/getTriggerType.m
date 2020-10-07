% ====================================================
%> @brief Gets the configured trigger type
%>
%> @param obj Instance of class
%>
%> @output triggerType Currently configured trigger type
%>
% =====================================================


function triggerType = getTriggerType(obj)
write(obj,"*WAI; TRIG:A:TYPE?");
message = obj.read;
message = strip(message);
if strlength(message) == 0
    error("no response from device");
end
triggerType = message;
end