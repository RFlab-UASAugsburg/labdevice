% ====================================================
%> @brief Turn a specific math channel on or off
%>
%> @param obj Instance of class
%> @param channel Selected math channel 1..5
%> @param status 'on' || 'off'
% =====================================================

function EnableDisableMathChannel (obj, channel, status)
	  if (channel >= 1 && channel <= 5)
         switch status
            case 'on'
                write(obj,"CALC:MATH" + channel + ":STAT ON");
            case 'off'
                write(obj,"CALC:MATH" + channel + ":STAT OFF");
            otherwise
                error('Unclear status. ' +status);
         end
      else
          error('Only math channels 1..5 are selectable');
    end

end


    