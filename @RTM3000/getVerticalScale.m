% ====================================================
%> @brief Gets the vertical scale for a specific channel
%>
%> @param obj Instance of class
%>
%> @param channel Selected channel 1..4
%>
%> @return VertScale Vertical position of the the indicated channel in [V/div]
% =====================================================

function VertScale = getVerticalScale(obj, channel)
	  if (channel >= 1 && channel <= 4)
            write(obj,"*WAI; CHAN"+channel+":SCAL?");
            message = obj.read;
            message = strip(message);
            if isempty(message)
                error("no response from device");
            end

          else
              error('Only channels 1-4 are selectable');
      end
    VertScale = message;
end