% ====================================================
%> @brief enables/Disables phase coupling
%>
%> @param obj Instance of class
%>
%> @param state 'on' || 'off'
%>
% =====================================================

function enableDisablePhaseCoupling(obj,state)

    states = {'ON','OFF'};
    state = upper(state);
    if any(strcmp(states,state))
        write(obj,":COUP:PHAS:STAT "+state);
    else
        error("State can only be" + string(join(states)));
    end

    
end