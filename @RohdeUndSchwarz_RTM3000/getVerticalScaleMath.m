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
    write(obj,"*WAI; CALC:MATH"+channel+":SCAL?");
    message = obj.read;
    message = strip(message);
    if strlength(message) == 0
        error("no response from device");
    end
    
else
    error('Only math channels 1-5 are selectable');
end
VertScaleMath = message;
end