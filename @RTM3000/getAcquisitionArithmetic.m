% ====================================================
%> @brief Gets the configured acquisition arithmetic
%>
%> @param obj Instance of class
%>
%> @param channel Selected channel
%>
%> @output acquisitionArithmetics Current acquisition arithmetic
%>
% =====================================================


function acquisitionArithmetic = getAcquisitionArithmetic(obj,channel)
write(obj,"CHAN"+channel+":ARIT?");
message = obj.read;
message = strip(message);
if isempty(message)
    error("no response from device");
end
acquisitionArithmetic = message;
end