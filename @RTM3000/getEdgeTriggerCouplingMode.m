% ====================================================
%> @brief Gets the configured edge trigger coupling
%>
%> @param obj Instance of class
%>
%> @output edgeTriggerCoupling Currently configured edge trigger coupling
%>
% =====================================================


function edgeTriggerCoupling = getEdgeTriggerCouplingMode(obj)
write(obj,"*WAI; TRIG:A:EDGE:COUP?");
message = obj.read;
message = strip(message);
if isempty(message)
    error("no response from device");
end
edgeTriggerCoupling = message;
end