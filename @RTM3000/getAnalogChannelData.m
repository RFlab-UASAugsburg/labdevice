% ====================================================
%> @brief Get analog channel data from selected channel
%>
%> @param obj Instance of class
%>
%> @param channel Selected channel
%>
% =====================================================

function AnalogChannelData = getAnalogChannelData(obj, channel)
    if channel == 1 || channel == 2 || channel == 3 || channel == 4
        write(obj,"*WAI; CHAN"+channel+":DATA?");
        message = obj.read;
        if strlength(message) == 0
            error("no response from device");
        end
        AnalogChannelData = strsplit(message,",");
        AnalogChannelData = str2double(AnalogChannelData);
    else
        error("Channel can only be set to 1-4");
    end
    
 end