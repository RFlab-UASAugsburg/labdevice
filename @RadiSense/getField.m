function ret = getField(obj)
%GETFIELD get averaged value of all axis
%
%   returns absolute value of the electric field vector, does three queries
%   since we don't know what the sensor does when we request a reading of
%   all axis at once.
messages = ["AEDD", "ADED", "ADDE"];
axis = [0,0,0];
for i = 1:3
    write(obj,messages(i));
    read(obj);
    write(obj,"D2");
    response = read(obj);
    if length(response) ~= 18
        msgID = "RADISENSE:WeirdError";
        msg = "something went wrong: " + response;
        throw(MException(msgID,msg));
    elseif response(14) == "O"
        msgID = "RADISENSE:OverRange";
        msg = "Probe returned over range warning!";
        throw(MException(msgID,msg));
    end
    axis(i) = double(string(extractBetween(response,3,7)));
end
ret = sqrt(axis(1).^2 + axis(2).^2 + axis(3).^2);
end

