% ====================================================
%> @brief set the amplitude unit
%>
%> @param obj Instance of class
%>
%> @param unit one of these unit strings: 'VPP','VRMS','DBM' 
%>        (note: DBM not available when impedance is set to HighZ)
%>
%> @param source Selected source
%>
% =====================================================

function setAmplitudeUnit(obj,source,unit)
    units = {'DBM','VPP','VRMS'};
    unit = upper(unit);
    if any(strcmp(units,unit))
        write(obj,":SOUR" + source + ":VOLT:UNIT " + unit);
    else
        error("unit can only be" + string(join(units)));
    end
end

