% ====================================================
%> @brief Sets the trigger source
%>
%> @param obj Instance of class
%>
%> @param source Desired trigger source
%>  available source strings:
%>                           Analog channels: 'CH1', 'CH2', ...
%>                           External trigger: 'EXT'
%>                           AC power supply line trigger: 'LINE'
%>                           (Serial Bus: 'SBUS1', 'SBUS2')
%>                           (Digital channels: 'D0','D1',...,'D15')
%> Note: purchasable addons can easily be added if certain addons are
%>       optained
%>
% =====================================================

function setTriggerSource(obj,source)
    sources = {'CH1','CH2','CH3','CH4','EXT','LINE'}; % Add additional source strings here if necessary
    source = upper(source);
    if any(strcmp(sources,source))
        write(obj,"*WAI; TRIG:A:SOUR "+source);
    else
        error("source can only be" + string(join(sources)));
    end 
end