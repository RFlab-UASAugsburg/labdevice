% ====================================================
%> @brief Gets wether or not frequency coupling is enabled
%>
%> @param obj Instance of class
%>
%> @output stateFrequencyCoupling amplitude coupling state: 'ON' or 'OFF'
%>
% =====================================================

function stateFrequencyCoupling = getFrequencyCouplingState(obj)
write(obj,":COUP:FREQ:STAT?");
message = obj.read;
message = strip(message);
if isempty(message)
    error("no response from device");
end

stateFrequencyCoupling = message;

    
end