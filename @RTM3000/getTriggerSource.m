% ====================================================
%> @brief Gets the configured trigger mode
%>
%> @param obj Instance of class
%>
%> @output triggerSource Currently configured trigger source
%>
% =====================================================


function triggerSource = getTriggerSource(obj)
write(obj,"TRIG:A:SOUR?");
message = obj.read;
message = strip(message);
if isempty(message)
    error("no response from device");
end
triggerSource = message;
end