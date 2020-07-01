% ====================================================
%> @brief Sets the trigger mode
%>
%> @param obj Instance of class
%>
%> @param mode Desired trigger mode
%>  available mode strings:
%>                         Automatic: 'AUTO'
%>                         Normal:    'NORM'
%>  Automatic: The Instrument triggers repeatedly after a time interval if
%>             the trigger conditions are not fulfilled. If a real trigger
%>             occurs, it takes precedence.
%>  Normal:    The Instrument acquires a waveform only if a trigger occurs.
%>
% =====================================================

function setTriggerMode(obj,mode)
    modes = {'AUTO','NORM'};
    mode = upper(mode);
    if any(strcmp(modes,mode))
        write(obj,"TRIG:A:MODE "+mode);
    else
        error("mode can only be" + string(join(modes)));
    end 
end