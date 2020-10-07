% ====================================================
%> @brief Get the horizontal scale of all channels and math waveforms
%>
%> @param obj Instance of class
%>
%> @return HorzScale Horizontal scale in [s/div]
% =====================================================

function HorzScale = getHorizontalScale(obj)
    write(obj, "*WAI; TIM:SCAL?");
    message = obj.read;
    message = strip(message);
    if strlength(message) == 0
        error("no response from device");
    end

    HorzScale = message;
end