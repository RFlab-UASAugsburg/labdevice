% ====================================================
%> @brief enables/Disables amplitude coupling
%>
%> @param obj Instance of class
%>
%> @param state 'on' || 'off'
%>
% =====================================================

function enableDisableAmplitudeCoupling(obj,state)

    states = {'ON','OFF'};
    state = upper(state);
    if any(strcmp(states,state))
        write(obj,":COUP:AMPL:STAT "+state);
    else
        error("State can only be" + string(join(states)));
    end

    
end