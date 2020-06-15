% ====================================================
%> @brief Change the horizontal scale for all channels and math waveforms
%(note: lower limits are possible if zoom or FFT is enabled)
%>
%> @param obj Instance of class
%> @param scale Desired scale of the horizontal axis (1e-9 to 50)s/div
% =====================================================

function setHorzScale(obj, scale)

    if (scale < 1e-9 | scale > 50)
        error('Scale is out of bounds. Keep it between 1e-9 and 50');
    else
        write(obj, ["TIM:SCAL "+scale+"; *WAI"]);
    end

end