function ret = getRange(obj)
%GETRANGE returns the currently set measurement range
%   cycle to the next range, calculate the previously set range from the
%   returned value, set the range back to the original value and return it
ret = obj.setRange("N");
ret = obj.setRange(mod(ret-2,4)+1);
end

