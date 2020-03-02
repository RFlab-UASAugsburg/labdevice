function unit = getPowUnit(obj)
%GET returns currently set power unit
%   Detailed explanation goes here
    obj.write("CALC:UNIT:POW?; *WAI");
    message = obj.read;
    message = strip(message);
    units = {'DBM','V','A','W','DBPW','WATT','DBUV','DBMV','VOLT','DBUA','AMP'};
    if ~any(strcmp(units,message))
        if isempty(message)
            error("no response from device");
        else
            fprintf(message);
            error("bad message from device");
            
        end
    else
        unit = message;
    end
end

