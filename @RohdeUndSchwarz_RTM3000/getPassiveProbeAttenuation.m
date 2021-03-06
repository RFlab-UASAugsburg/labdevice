% ====================================================
%> @brief Gets the configured passive probe attenuation/gain of the selected channel
%>
%> @param obj Instance of class
%>
%> @param channel Selected channel
%>
%> @output att_gain Current passive probe attenuation/gain
%>
% =====================================================


function att_gain = getPassiveProbeAttenuation(obj,channel)
write(obj,"*WAI; PROB"+channel+":SET:ATT:MAN?");
message = obj.read;
message = strip(message);
if strlength(message) == 0
    error("no response from device");
end
att_gain = message;
end