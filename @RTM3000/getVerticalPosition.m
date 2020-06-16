% ====================================================
%> @brief Gets the vertical position for a specific channel
%>
%> @param obj Instance of class
%> @param channel Selected channel 1..4
%>
%> @return VertPos Vertical position of the waveform in [div]
% =====================================================

function VertPos = getVerticalPosition(obj, channel)
	  if (channel >= 1 & channel <= 4)
            write(obj, ["CHAN"+channel+":POS?; *WAI"]);
            message = obj.read;
            message = strip(message);
            if isempty(message)
                error("no response from device");
            end

          else
              error('Only channels 1-4 are selectable');
      end
    VertPos = message;
end