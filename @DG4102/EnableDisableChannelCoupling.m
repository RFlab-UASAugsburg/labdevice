% ====================================================
%> @brief Enable/Disable channel coupling
%>  note: The command turns on/off frequency, phase and amplitude coupling
%>
%> @param obj Instance of class
%>
%> @param state Sweep state either ON or OFF
%>
% =====================================================
function EnableDisableChannelCoupling(obj, state)
state = upper(state);
switch state
    case 'ON'
        write(obj,":COUP:STAT ON");
    case 'OFF'
        write(obj,":COUP:STAT OFF");
    otherwise
        error("Unclear state. Either 'ON' or 'OFF'");
end



end
