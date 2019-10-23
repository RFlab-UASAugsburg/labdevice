function setRange(obj, range)
%SETRANGE set measurement range
%   1: 0 to 10 V/m
%   2: 10 to 30 V/m
%   3: 30 to 100 V/m
%   4: 100 to end of spec (overload from 600 V/m)
    if (0 < range)&&(range < 5)
        write(obj, "R" + num2str(range));
    elseif range == "N"
            write(obj, "RN");
    else
        fprintf("range can only be 1, 2, 3, 4");
        return
    end
    response = read(obj);
    if response(2) ~= "R"
        fprintf("could not set range!");
    else
        obj.range = response(3);
    end
end

