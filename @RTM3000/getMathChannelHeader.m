% ====================================================
%> @brief Get math channel header from selected channel
%>
%> @param obj Instance of class
%>
%> @param channel Selected math channel
%>
%> @return Comma-separated value list  with: XStart in s 
%>                                           XStop in s
%>                                           Record length of waveform in Samples 
%>                                           Number of values per sample interval
%>
% =====================================================

function MathChannelHeader = getMathChannelHeader(obj, channel)
    if channel == 1 || channel == 2 || channel == 3 || channel == 4 || channel == 5
        write(obj,"*WAI; CALC:MATH"+channel+":DATA:HEAD?");
        message = obj.read;
        if isempty(message)
            error("no response from device");
        end
        MathChannelHeader = strsplit(message,",");
    else
        error("Channel can only be set to 1-5");
    end
    
 end