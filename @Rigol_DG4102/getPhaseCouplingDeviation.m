% ====================================================
%> @brief Gets the phase coupling deviation
%>
%> @param obj Instance of class
%>
%> @output phaseCouplingDeviation Current phase coupling deviation
% =====================================================

function phaseCouplingDeviation = getPhaseCouplingDeviation(obj)
write(obj,":COUP:PHAS:DEV?");
message = obj.read;
message = strip(message);
if isempty(message)
    error("no response from device");
end
phaseCouplingDeviation = message;  
end