% ====================================================
%> @brief Gets wether or not phase coupling is enabled
%>
%> @param obj Instance of class
%>
%> @output statePhaseCoupling phase coupling state: 'ON' or 'OFF'
%>
% =====================================================

function statePhaseCoupling = getPhaseCouplingState(obj)
write(obj,":COUP:PHAS:STAT?");
message = obj.read;
message = strip(message);
if isempty(message)
    error("no response from device");
end

statePhaseCoupling = message;

    
end