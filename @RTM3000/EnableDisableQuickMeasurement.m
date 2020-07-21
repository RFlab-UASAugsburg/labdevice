% ====================================================
%> @brief Turn a specific measurement place on or off
%>
%> @param obj Instance of class
%> @param place Selected 
%> @param status 'on' || 'off'
% =====================================================

function EnableDisableQuickMeasurement(obj, place, status)
	  if (place >= 1 && place <= 8)
         status = upper(status);
         switch status
            case 'ON'
                write(obj,"MEAS"+place+" ON");
            case 'OFF'
                write(obj,"MEAS"+place+" OFF");
            otherwise
                error('Unclear status. ' +status);
         end
      else
          error('Only measurement places 1..8 are selectable');
    end

end
