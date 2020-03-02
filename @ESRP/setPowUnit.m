function setPowUnit(obj,unit)
%SETPOWUNIT sets power unit and checks if operation was successfull
%   Detailed explanation goes here
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

