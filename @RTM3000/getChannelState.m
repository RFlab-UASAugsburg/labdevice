% ====================================================
%> @brief Check if Channel is enabled or disabled
%>
%> @param obj Instance of class
%>
%> @param channel Selected channel 1..4
%>
%> @return Current state of the selected channel: 1 = ON
%>                                                0 = OFF
% =====================================================

function CurrentChannelState = getChannelState(obj, channel)
    if(channel >= 1 & channel <= 4)
        write(obj,"CHAN" + channel + ":STAT?; *WAI");
        message = obj.read;
        message = strip(message);
        if isempty(message)
            error("no response from device");
        end
    else
        error('Only channels 1-4 are selectable');
    end
    CurrentChannelState = message;

end






