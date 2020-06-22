% ====================================================
%> @brief Gets the vertical position for a math specific channel
%>
%> @param obj Instance of class
%>
%> @param channel Selected channel 1..5
%>
%> @return VertPosMath Vertical position of the waveform in [div]
%>
% =====================================================

function VertPosMath = getVerticalPositionMath(obj, channel)
if (channel >= 1 && channel <= 5)
    write(obj,"CALC:MATH<"+channel+">:POS?; *WAI");
    message = obj.read;
    message = strip(message);
    if isempty(message)
        error("no response from device");
    end
    
else
    error('Only math channels 1-5 are selectable');
end
VertPosMath = message;
end