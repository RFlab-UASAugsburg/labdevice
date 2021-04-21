% ====================================================
%> @brief Sets the passive probe measuring unit of the selected channel
%>
%> @param obj Instance of class
%>
%> @param channel Selected channel
%>
%> @param unit Selected measuring unit
%>
%>  available unit strings:
%>  Volt:   'V'
%>  Ampere: 'A'
%>
% =====================================================

function setPassiveProbeMeasuringUnit(obj,channel,unit)
    types = {'A','V'};
    unit = upper(unit);
    if channel < 1 || channel > 4
        error("Channel can only be between 1-4");
    else
        if any(strcmp(types,unit))
            write(obj,"*WAI; PROB"+channel+":SET:ATT:UNIT "+unit);
        else
            error("measuring units can only be" + string(join(types)));
        end 
    end
end