% ====================================================
%> @brief Sets the base channel of the channel coupling
%>
%> @param obj Instance of class
%>
%> @param base Selected channel as base channel
%>
% =====================================================

function setCouplingBaseChannel(obj,base)

    channels = {'CH1','CH2'};
    base = upper(base);
    if any(strcmp(channels,base))
        write(obj,":COUP:CH:BASE "+base);
    else
        error("Base can only be" + string(join(channels)));
    end

    
end