function ret = setRange(obj, range)
%SETRANGE set measurement range
%
%   1: 0 to 10 V/m
%   2: 10 to 30 V/m
%   3: 30 to 100 V/m
%   4: 100 to end of spec (overload from 600 V/m)
%   N: Cycle to the next bigger range step, goes from 4 back to 1 at the
%   end
    legalInput = ["1","2","3","4","N"];
    if ismember(num2str(range),legalInput)
        write(obj, "R" + num2str(range));
    else
        msgID = "RADISENSE:BadInput";
        msg = "range can only be 1, 2, 3, 4, or N to cycle to the next range step";
        throw(MException(msgID,msg));
    end
    response = read(obj);
    if length(response) ~= 3
        msgID = "RADISENSE:WeirdError";
        msg = "could not set range" + response;
        throw(MException(msgID,msg));
    end
    ret = response(3);
end

