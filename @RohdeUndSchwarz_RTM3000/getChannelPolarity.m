% ====================================================
%> @brief Gets the configured channel polarity of the selected channel
%>
%> @param obj Instance of class
%>
%> @param channel Selected channel
%>
%> @output pol Currently set channel polarity
%>
% =====================================================


function pol = getChannelPolarity(obj,channel)
write(obj,"*WAI; CHAN"+channel+":POL?");
message = obj.read;
message = strip(message);
if strlength(message) == 0
    error("no response from device");
end
pol = message;
end