% ====================================================
%> @brief Get the number of math channel data samples from a selected
%>  channel that are returned with getMathChannelData.m
%>
%> @param obj Instance of class
%>
%> @param channel Selected math channel
%>
%> @return MathChannelDataSampleCount Number of data points 
%>
% =====================================================

function MathChannelDataSampleCount = getMathChannelDataSampleCount(obj, channel)
    if channel == 1 || channel == 2 || channel == 3 || channel == 4 || channel == 5
        write(obj,"*WAI; CALC:MATH"+channel+":DATA:POIN?");
        message = obj.read;
        if strlength(message) == 0
            error("no response from device");
        end
        MathChannelDataSampleCount = strsplit(message,",");
    else
        error("Channel can only be set to 1-5");
    end
    
 end