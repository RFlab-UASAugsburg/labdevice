% ====================================================
%> @brief Change the vertical scale for a specific math channel
%>
%> @param obj Instance of class
%>
%> @param channel Selected channel 1..5
%>
%> @param pos Desired vertical postition in [V/div]
%>
% =====================================================

function setVerticalScaleMath(obj, channel, scale)
if (channel >= 1 && channel <= 5)
    write(obj,"CALC:MATH<"+channel+">:SCAL "+scale+"; *WAI");
else
    error('Only math channels 1 to 5 are selectable');
end

end