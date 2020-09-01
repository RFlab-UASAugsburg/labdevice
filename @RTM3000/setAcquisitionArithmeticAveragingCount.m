% ====================================================
%> @brief Change the vertical scale for a specific channel
%>
%> @param obj Instance of class
%>
%> @param count Desired acquisition averaging count (2..1E6)
% =====================================================

function setAcquisitionArithmeticAveragingCount(obj,count)

if count < 2 || count > 100000
    error('Averaging count is out of bounds. Keep it between 2 and 100000');
else
    write(obj,"ACQ:AVER:COUN "+count);
end

end