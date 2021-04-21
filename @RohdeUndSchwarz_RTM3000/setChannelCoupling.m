% ====================================================
%> @brief Sets the channel coupling of the selected channel
%>
%> @param obj Instance of class
%>
%> @param channel Selected channel
%>
%> @param coupling Selected coupling mode
%>
%>  available coupling strings:
%>  DC Coupling:             'DC'  for 50Ohm termination
%>                           'DCL' for 1MOhm termination
%>  AC Coupling:             'ACL'
%>  Virtual Ground Coupling: 'GND'
%>
% =====================================================

function setChannelCoupling(obj,channel,coupling)
    types = {'DC','DCL','ACL','GND'};
    coupling = upper(coupling);
    if channel < 1 || channel > 4
        error("Channel can only be between 1-4");
    else
        if any(strcmp(types,coupling))
            write(obj,"*WAI; CHAN"+channel+":COUP "+coupling);
        else
            error("coupling mode can only be" + string(join(types)));
        end 
    end
end