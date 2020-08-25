% ====================================================
%> @brief Sets the trigger type
%>
%> @param obj Instance of class
%>
%> @param type Desired trigger type
%>  available type strings:
%>                         Edge trigger: 'EDGE'
%>                         Width trigger: 'WIDTH'
%>                         Video trigger: 'TV'
%>                         Pattern/logic trigger: 'LOG'
%>                         Power supply line: 'LINE'
%>                         Transition trigger: 'RIS'
%>                         Trigger on runts: 'RUNT'
%>                         (Serial trigger: 'BUS')
%>  Note: purchasable addons can easily be added if certain addons are
%>        obtained
%>
% =====================================================

function setTriggerType(obj,type)
    types = {'EDGE','WIDTH','TV','LOG','LINE','RIS','RUNT'}; % Add additional source strings here if necessary
    type = upper(type);
    if any(strcmp(types,type))
        write(obj,"TRIG:A:TYPE "+type);
    else
        error("type can only be" + string(join(types)));
    end 
end