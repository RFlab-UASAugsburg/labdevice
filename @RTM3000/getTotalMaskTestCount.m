% ====================================================
%> @brief Returns the number of tested acquisitions
%>
%> @param obj Instance of class
%>
%> @output totalCount Number of tested acquisitions
%>
% =====================================================


function totalCount = getTotalMaskTestCount(obj)
TenSecNoResponse = 0;
write(obj,"*WAI; MASK:COUN?");
message = obj.read;
message = strip(message);
while strlength(message) == 0
    pause(1);
    TenSecNoResponse = TenSecNoResponse +1;
    write(obj,"*WAI; MASK:COUN?");
    message = obj.read;
    message = strip(message);
    if strlength(message) == 0 & TenSecNoResponse == 10
        error("no response from device for 10 seconds");
    elseif strlength(message) ~= 0
        break;
    end
end
totalCount = str2double(message);
end
