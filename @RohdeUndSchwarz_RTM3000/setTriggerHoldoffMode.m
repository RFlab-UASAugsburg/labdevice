% ====================================================
%> @brief Turns trigger holdoff time on or off
%>
%> @param obj Instance of class
%>
%> @param state Selected state of the trigger holdoff time
%>  possible state strings:
%>                         Enable:  'ON'
%>                         Disable: 'OFF'
%>  Note: Does not work with no extra packages purchased for the device 
% =====================================================

function setTriggerHoldoffMode(obj,state)
        state = upper(state);
         switch state
            case 'ON'
                write(obj,"*WAI; TRIG:A:GOLD:MODE TIME");
            case 'OFF'
                write(obj,"*WAI; TRIG:A:GOLD:MODE OFF");
            otherwise
                error('Unclear state. ' +state);
         end      
end