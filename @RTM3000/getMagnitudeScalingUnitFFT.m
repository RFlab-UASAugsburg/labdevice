% ====================================================
%> @brief Get the FFT y-axis scaling unit
%>
%> @param obj Instance of class
%>
%> @return Magnitude scaling unit, e.g. 'DBM'
% =====================================================

function MagScaleUnitFFT = getMagnitudeScalingUnitFFT(obj)
    write(obj,"SPEC:FREQ:MAGN:SCAL?; *WAI");
    message = obj.read;
    message = strip(message);
    if strlength(message) == 0
        error("no response from device");
    end

    MagScaleUnitFFT = message;
end