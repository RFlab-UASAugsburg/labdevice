% ====================================================
%> @brief Gets the configured trigger offset
%>
%> @param obj Instance of class
%>
%> @output offset Currently set trigger offset
%>
% =====================================================


function offset = getTriggerOffset(obj)
write(obj,"*WAI; TIM:POS?");
message = obj.read;
message = strip(message);
if isempty(message)
    error("no response from device");
end
offset = message;
end