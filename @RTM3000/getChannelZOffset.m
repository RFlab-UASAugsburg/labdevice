% ====================================================
%> @brief Gets the configured zero offset of the selected channel
%>
%> @param obj Instance of class
%>
%> @param channel Selected channel
%>
%> @output zoffset Currently set zero offset
%>
% =====================================================


function zoffset = getChannelZOffset(obj,channel)
write(obj,"*WAI; CHAN"+channel+":ZOFF?");
message = obj.read;
message = strip(message);
if isempty(message)
    error("no response from device");
end
zoffset = message;
end