% ====================================================
%> @brief Sets the zero offset of the selected channel
%>
%> @param obj Instance of class
%>
%> @param channel Selected channel
%>
%> @param zoffset Selected zero offset in [V]
%>
% =====================================================

function setChannelZOffset(obj,channel,zoffset)
    if channel < 1 || channel > 4
        error("Channel can only be between 1-4");
    else
        write(obj,"CHAN"+channel+":ZOFF "+zoffset);
    end
end