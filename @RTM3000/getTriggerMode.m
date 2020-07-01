% ====================================================
%> @brief Gets the configured trigger mode
%>
%> @param obj Instance of class
%>
%> @output triggerMode Currently configured trigger mode
%>
% =====================================================


function triggerMode = getTriggerMode(obj)
write(obj,"TRIG:A:MODE?");
message = obj.read;
message = strip(message);
if isempty(message)
    error("no response from device");
end
triggerMode = message;
end