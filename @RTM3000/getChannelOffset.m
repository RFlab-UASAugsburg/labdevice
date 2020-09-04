% ====================================================
%> @brief Gets the configured offset voltage of the selected channel
%>
%> @param obj Instance of class
%>
%> @param channel Selected channel
%>
%> @output offset Currently set offset voltage
%>
% =====================================================


function offset = getChannelOffset(obj,channel)
write(obj,"*WAI; CHAN"+channel+":OFFS?");
message = obj.read;
message = strip(message);
if isempty(message)
    error("no response from device");
end
offset = message;
end