% ====================================================
%> @brief Change the vertical scale for a specific math channel
%>
%> @param obj Instance of class
%>
%> @param channel Selected math channel 1..5
%>
%> @param pos Desired vertical postition in [V/div]
%>
% =====================================================

function setVerticalScaleMath(obj, channel, scale)
if (channel >= 1 && channel <= 5)
    write(obj,"*WAI; CALC:MATH"+channel+":SCAL "+scale);
else
    error('Only math channels 1 to 5 are selectable');
end

end