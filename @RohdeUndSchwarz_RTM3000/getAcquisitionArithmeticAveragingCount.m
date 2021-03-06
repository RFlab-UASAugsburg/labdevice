% ====================================================
%> @brief Gets the configured acquisition arithmetic averaging count
%>
%> @param obj Instance of class
%>
%> @output averagingCount Current acquisition arithmetic averaging count
%>
% =====================================================


function averagingCount = getAcquisitionArithmeticAveragingCount(obj)
write(obj,"*WAI; ACQ:AVER:COUN?");
message = obj.read;
message = strip(message);
if strlength(message) == 0
    error("no response from device");
end
averagingCount = message;
end