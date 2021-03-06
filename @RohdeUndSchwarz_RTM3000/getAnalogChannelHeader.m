% ====================================================
%> @brief Get analog channel header from selected channel
%>
%> @param obj Instance of class
%>
%> @param channel Selected channel
%>
%> @return Comma-separated value list  with: XStart in s 
%>                                           XStop in s
%>                                           Record length of waveform in Samples 
%>                                           Number of values per sample interval
% =====================================================

function AnalogChannelHeader = getAnalogChannelHeader(obj, channel)
    if channel == 1 || channel == 2 || channel == 3 || channel == 4
        write(obj,"*WAI; CHAN"+channel+":DATA:HEAD?");
        message = obj.read;
        if strlength(message) == 0
            error("no response from device");
        end
        AnalogChannelHeader = [{'XStart in s','XStop in s','waveform in samples','Num of values per sample interval'};strsplit(message,',')];
    else
        error("Channel can only be set to 1-4");
    end
    
 end