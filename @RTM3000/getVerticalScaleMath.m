% ====================================================
%> @brief Gets the vertical scale for a math specific channel
%>
%> @param obj Instance of class
%>
%> @param channel Selected math channel 1..5
%>
%> @return VertPosMath Vertical position of the waveform in [div]
%>
% =====================================================

function VertScaleMath = getVerticalScaleMath(obj, channel)
if (channel >= 1 && channel <= 5)
    write(obj,"CALC:MATH"+channel+":SCAL?; *WAI");
    message = obj.read;
    message = strip(message);
    if isempty(message)
        error("no response from device");
    end
    
else
    error('Only math channels 1-5 are selectable');
end
VertScaleMath = message;
end