% ====================================================
%> @brief Change the vertical position for a specific math channel
%>
%> @param obj Instance of class
%>
%> @param channel Selected channel 1..5
%>
%> @param pos Desired vertical postition in [div]
%>
% =====================================================

function setVerticalPositionMath(obj, channel, pos)
if (channel >= 1 && channel <= 5)
    write(obj,"CALC:MATH<"+channel+">:POS "+pos+"; *WAI");
else
    error('Only math channels 1 to 5 are selectable');
end

end