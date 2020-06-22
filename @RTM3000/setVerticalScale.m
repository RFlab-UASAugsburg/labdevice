% ====================================================
%> @brief Change the vertical scale for a specific channel
%>
%> @param obj Instance of class
%>
%> @param channel Selected channel 1..4
%>
%> @param scale Desired scale of the vertical axis (1e-3 to 10)V/div
% =====================================================

function setVerticalScale(obj, channel, scale)
	  if (channel >= 1 & channel <= 4)
          if (scale < 1e-3 | scale > 10)
              error('Scale is out of bounds. Keep it between 1e-3 and 10');
          else
              write(obj, ["CHAN"+channel+":SCAL "+scale+"; *WAI"]); 
          end         
      else
          error('Only channels 1-4 are selectable');
    end

end