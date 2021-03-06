% ====================================================
%> @brief Gets the configured deskew time of the selected channel
%>
%> @param obj Instance of class
%>
%> @param channel Selected channel
%>
%> @output deskew_time Currently set channel polarity
%>
% =====================================================


function deskew_time = getChannelDeskew(obj,channel)
write(obj,"*WAI; CHAN"+channel+":SKEW?");
message = obj.read;
message = strip(message);
if strlength(message) == 0
    error("no response from device");
end
deskew_time = message;
end