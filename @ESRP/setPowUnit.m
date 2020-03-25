% ====================================================
%> @brief set the power unit (Y axis unit)
%>
%> also checks if the operation was successful
%>
%> @param obj Instance of class
%> @param unit one of these unit strings: 'DBM','V','A','W','DBPW','WATT','DBUV','DBMV','VOLT','DBUA','AMP'
% =====================================================

function setPowUnit(obj,unit)
    units = {'DBM','V','A','W','DBPW','WATT','DBUV','DBMV','VOLT','DBUA','AMP'};
    unit = upper(unit);
    if any(strcmp(units,unit))
        obj.write("CALC:UNIT:POW " + unit);
        if obj.getPowUnit ~= unit
            error("couldn't set unit!");
        end
    else
        error("unit can only be" + string(join(units)));
    end
end

