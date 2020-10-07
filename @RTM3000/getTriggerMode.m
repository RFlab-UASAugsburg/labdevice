% ====================================================
%> @brief Gets the configured trigger mode
%>
%> @param obj Instance of class
%>
%> @output triggerMode Currently configured trigger mode
%>
% =====================================================


function triggerMode = getTriggerMode(obj)
write(obj,"*WAI; TRIG:A:MODE?");
message = obj.read;
message = strip(message);
if strlength(message) == 0
    error("no response from device");
end
triggerMode = message;
end