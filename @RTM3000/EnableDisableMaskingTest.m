% ====================================================
%> @brief Turn mask test on or off
%>
%> @param obj Instance of class
%>
%> @param state On-Off switch for the mask test
%>
% =====================================================

function EnableDisableMaskingTest(obj, state)
        state = upper(state);
         switch state
            case 'ON'
                write(obj,"*WAI; MASK:STAT ON");
            case 'OFF'
                write(obj,"*WAI; MASK:STAT OFF");
            otherwise
                error('Unclear state. ' +state);
         end      
end