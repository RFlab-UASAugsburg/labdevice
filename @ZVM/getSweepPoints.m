function points = getSweepPoints(obj)
%GETSWEEPPOINTS Summary of this function goes here
%   Detailed explanation goes here
obj.write('SWE:POINTS?');
points = str2double(obj.read());
end

