% ====================================================
%> @brief set the FFT magnitude scaling unit
%> @param obj Instance of class
%> @param unit one of the named units: 'LIN','DBM','DBV'
% =====================================================

function setMagnitudeScalingUnitFFT(obj,unit)
    units = {'LIN','DBM','DBV'};
    unit = upper(unit);
    if any(strcmp(units,unit))
        write(obj,"SPEC:FREQ:MAGN:SCAL "+ unit);
    else
        error("unit can only be" + string(join(units)));
    end

end