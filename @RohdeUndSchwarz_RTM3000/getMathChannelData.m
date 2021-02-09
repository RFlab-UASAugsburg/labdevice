% ====================================================
%> @brief Get math channel data from selected channel
%>
%> @param obj Instance of class
%>
%> @param channel Selected math channel
%>
% =====================================================

function MathChannelData = getMathChannelData(obj, channel)
    if channel == 1 || channel == 2 || channel == 3 || channel == 4 || channel == 5
        write(obj,"*WAI; CALC:MATH"+channel+":DATA?");
        message = obj.read;
        if strlength(message) == 0
            error("no response from device");
        end
        MathChannelData = strsplit(message,",");
        MathChannelData = str2double(MathChannelData);
    else
        error("Channel can only be set to 1-4");
    end
    
 end