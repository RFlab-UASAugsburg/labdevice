% ====================================================
%> @brief Get the configured sampling rate
%>
%> @param obj Instance of class
%>
%> @param place Configured sampling rate in [Sa/s]
%>
% =====================================================

function SampleRate = getSampleRate(obj)

write(obj,"*WAI; ACQ:SRAT?");
message = obj.read;
if strlength(message) == 0
    error("no response from device");
end
SampleRate = str2double(message);

end