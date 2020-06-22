% ====================================================
%> @brief Turn a specific channel on or off
%>
%> @param obj Instance of class
%>
%> @param channel Selected channel 1..4
%>
%> @param status 'on' || 'off'
%>
% =====================================================

function EnableDisableChannel (obj, channel, status)
	  if (channel >= 1 & channel <= 4)
         switch status
            case 'on'
                write(obj,"CHAN" + channel + ":STAT ON");
            case 'off'
                write(obj,"CHAN" + channel + ":STAT OFF");
            otherwise
                error('Unclear status. ' +status);
         end
      else
          error('Only channels 1-4 are selectable');
    end

end


    