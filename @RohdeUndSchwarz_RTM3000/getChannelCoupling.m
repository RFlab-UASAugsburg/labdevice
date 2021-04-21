% ====================================================
%> @brief Gets the configured coupling mode of the selected channel
%>
%> @param obj Instance of class
%>
%> @param channel Selected channel
%>
%> @output couplingMode Currently configured channel coupling
%>
% =====================================================


function couplingMode = getChannelCoupling(obj,channel)
write(obj,"*WAI; CHAN"+channel+":COUP?");
message = obj.read;
message = strip(message);
if strlength(message) == 0
    error("no response from device");
end
couplingMode = message;
end