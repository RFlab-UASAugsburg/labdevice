% ====================================================
%> @brief Get wether the output sweep is enabled or disabled
%>
%> @param obj Instance of class
%>
%> @output couplingBaseChannel Current base channel of the channel coupling
%>
% =====================================================

function couplingBaseChannel = getCouplingBaseChannel(obj)
write(obj,":COUP:CH:BASE?");
message = obj.read;
message = strip(message);
if isempty(message)
    error("no response from device");
end

couplingBaseChannel = message;

    
end