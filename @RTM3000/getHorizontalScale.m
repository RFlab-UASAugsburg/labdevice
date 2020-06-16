% ====================================================
%> @brief Get the horizontal scale of all channels and math waveforms
%>
%> @param obj Instance of class
%>
%> @return HorzScale Horizontal scale in [s/div]
% =====================================================

function HorzScale = getHorizontalScale(obj)
    write(obj, "TIM:SCAL?; *WAI");
    message = obj.read;
    message = strip(message);
    if isempty(message)
        error("no response from device");
    end

    HorzScale = message;
end