% ====================================================
%> @brief Returns the number of tested acquisitions that hit the mask
%>
%> @param obj Instance of class
%>
%> @output violationCount Number of tested acquisitions that voilated the
%>                        mask
%>
% =====================================================


function violationCount = getTotalFailedMaskTestCount(obj)
write(obj,"*WAI; MASK:VCO?");
message = obj.read;
message = strip(message);
if isempty(message)
    error("no response from device");
end
violationCount = message;
end