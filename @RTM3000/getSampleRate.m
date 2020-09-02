% ====================================================
%> @brief Get the configured sampling rate
%>
%> @param obj Instance of class
%>
%> @param place Configured sampling rate in [Sa/s]
%>
% =====================================================

function SampleRate = getSampleRate(obj)

write(obj,"ACQ:SRAT?; *WAI");
message = obj.read;
if isempty(message)
    error("no response from device");
end
SampleRate = str2double(message);

end