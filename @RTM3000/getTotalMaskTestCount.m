% ====================================================
%> @brief Returns the number of tested acquisitions
%>
%> @param obj Instance of class
%>
%> @output totalCount Number of tested acquisitions
%>
% =====================================================


function totalCount = getTotalMaskTestCount(obj)
write(obj,"*WAI; MASK:COUN?");
message = obj.read;
message = strip(message);
if isempty(message)
    error("no response from device");
end
totalCount = message;
end