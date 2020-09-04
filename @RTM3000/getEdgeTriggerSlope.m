% ====================================================
%> @brief Gets the configured edge trigger slope
%>
%> @param obj Instance of class
%>
%> @output edgeTriggerSlope Currently configured edge trigger slope
%>
% =====================================================


function edgeTriggerSlope = getEdgeTriggerSlope(obj)
write(obj,"*WAI; TRIG:A:EDGE:SLOP?");
message = obj.read;
message = strip(message);
if isempty(message)
    error("no response from device");
end
edgeTriggerSlope = message;
end