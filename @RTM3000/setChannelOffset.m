% ====================================================
%> @brief Sets the channel offset of the selected channel
%>
%> @param obj Instance of class
%>
%> @param channel Selected channel
%>
%> @param offset Selected offset in [V]
%> Note: Depends on vertical scale and probe attenuation
%>
% =====================================================

function setChannelOffset(obj,channel,offset)
    if channel < 1 || channel > 4
        error("Channel can only be between 1-4");
    else
        write(obj,"CHAN"+channel+":OFFS "+offset);
    end
end