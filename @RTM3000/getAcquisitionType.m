% ====================================================
%> @brief Gets the configured acquisition type
%>
%> @param obj Instance of class
%>
%> @param channel Selected channel
%>
%> @output acquisitionType Currently configured acquisition type
%>
% =====================================================


function acquisitionType = getAcquisitionType(obj,channel)
write(obj,"CHAN"+channel+":TYPE?");
message = obj.read;
message = strip(message);
if isempty(message)
    error("no response from device");
end
acquisitionType = message;
end