% ====================================================
%> @brief Gets wether or not amplitude coupling is enabled
%>
%> @param obj Instance of class
%>
%> @output stateAmplitudeCoupling amplitude coupling state: 'ON' or 'OFF'
%>
% =====================================================

function stateAmplitudeCoupling = getAmplitudeCouplingState(obj)
write(obj,":COUP:AMPL:STAT?");
message = obj.read;
message = strip(message);
if isempty(message)
    error("no response from device");
end

stateAmplitudeCoupling = message;

    
end