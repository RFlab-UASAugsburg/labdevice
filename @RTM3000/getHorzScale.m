% ====================================================
%> @brief Get the horizontal scale for all channels and math waveforms
%>
%> @param obj Instance of class
% =====================================================

function Scale = getHorzScale(obj)
    write(obj, ['TIM:SCAL?; *WAI']);
    message = obj.read;
    message = strip(message);
    if isempty(message)
        error("no response from device");
    end

    Scale = message;
end