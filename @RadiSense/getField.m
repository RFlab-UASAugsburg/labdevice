function ret = getField(obj)
%GETFIELD Summary of this function goes here
%   Detailed explanation goes here
write(obj, "D2");
response = read(obj);
if length(response) ~= 18
    fprintf("something went wrong: " + response);
    ret = 1;
    return;
end
if response(14) == O
    fprintf("Over range!");
    ret = 1;
    return;
end
ret = extractBetween(response,3,7);
end

