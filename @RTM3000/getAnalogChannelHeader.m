% ====================================================
%> @brief Get analog channel header from selected channel
%>
%> @param obj Instance of class
%> @param channel Selected channel
%> @return Comma-separated value list  with: XStart in s 
%>                                           XStop in s
%>                                           Record length of waveform in Samples 
%>                                           Number of values per sample interval
% =====================================================

function AnalogChannelHeader = getAnalogChannelHeader(obj, channel)
    if channel == 1 || channel == 2 || channel == 3 || channel == 4
        write(obj,"CHAN"+channel+":DATA:HEAD?; *WAI");
        message = obj.read;
        if isempty(message)
            error("no response from device");
        end
        AnalogChannelHeader = strsplit(message,",");
    else
        error("Channel can only be set to 1-4");
    end
    
 end