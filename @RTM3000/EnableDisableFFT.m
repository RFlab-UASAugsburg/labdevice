% ====================================================
%> @brief Turn FFT on or off
%>
%> @param obj Instance of class
%> @param state On-Off switch for the FFT
% =====================================================

function EnableDisableFFT(obj, state)
        state = upper(state);
         switch state
            case 'ON'
                write(obj,"SPEC:STAT ON");
            case 'OFF'
                write(obj,"SPEC:STAT OFF");
            otherwise
                error('Unclear status. ' +status);
         end      
end