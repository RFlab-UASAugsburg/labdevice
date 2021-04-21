% ====================================================
%> @brief enables/Disables frequency coupling
%>
%> @param obj Instance of class
%>
%> @param state 'on' || 'off'
%>
% =====================================================

function enableDisableFrequencyCoupling(obj,state)

    states = {'ON','OFF'};
    state = upper(state);
    if any(strcmp(states,state))
        write(obj,":COUP:FREQ:STAT "+state);
    else
        error("State can only be" + string(join(states)));
    end

    
end