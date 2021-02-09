% ====================================================
%> @brief Sets the deskew time of the selected channel
%>
%> @param obj Instance of class
%>
%> @param channel Selected channel
%>
%> @param deskew_time Selected deskew time in [s]
%>
% =====================================================

function setChannelDeskew(obj,channel,deskew_time)
    if channel < 1 || channel > 4
        error("Channel can only be between 1-4");
    else
        write(obj,"*WAI; CHAN"+channel+":SKEW "+deskew_time);
    end
end