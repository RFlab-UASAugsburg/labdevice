% ====================================================
%> @brief Gets the configured passive probe measuring unit of the selected channel
%>
%> @param obj Instance of class
%>
%> @param channel Selected channel
%>
%> @output measuringUnit Current passive probe measuring unit
%>
% =====================================================


function measuringUnit = getPassiveProbeMeasuringUnit(obj,channel)
write(obj,"*WAI; PROB"+channel+":SET:ATT:UNIT?");
message = obj.read;
message = strip(message);
if isempty(message)
    error("no response from device");
end
measuringUnit = message;
end