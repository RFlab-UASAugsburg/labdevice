% ====================================================
%> @brief Gets the amplitude coupling deviation
%>
%> @param obj Instance of class
%>
%> @output amplitudeCouplingDeviation Current amplitude coupling deviation
% =====================================================

function amplitudeCouplingDeviation = getAmplitudeCouplingDeviation(obj)
write(obj,":COUP:AMPL:DEV?");
message = obj.read;
message = strip(message);
if isempty(message)
    error("no response from device");
end
amplitudeCouplingDeviation = message;  
end