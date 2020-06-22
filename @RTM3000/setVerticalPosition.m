% ====================================================
%> @brief Change the vertical position for a specific channel
%>
%> @param obj Instance of class
%>
%> @param channel Selected channel 1..4
%>
%> @param pos Desired vertical postition (-5 to 5)div
% =====================================================

function setVerticalPosition(obj, channel, pos)
	  if (channel >= 1 & channel <= 4)
          if (pos < -5 | pos > 5)
              error('Position is out of bounds. Keep it between -5 and 5');
          else
              write(obj, ["CHAN"+channel+":POS "+pos+"; *WAI"]); 
          end         
      else
          error('Only channels 1 to 4 are selectable');
    end

end