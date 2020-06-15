% ====================================================
%> @brief Gets the vertical scale for a specific channel
%>
%> @param obj Instance of class
%> @param channel Selected channel 1..4
% =====================================================

function Scale = getVertScale(obj, channel)
	  if (channel >= 1 & channel <= 4)
            write(obj, ["CHAN"+channel+":SCAL?; *WAI"]);
            message = obj.read;
            message = strip(message);
            if isempty(message)
                error("no response from device");
            end

          else
              error('Only channels 1-4 are selectable');
      end
    Scale = message;
end