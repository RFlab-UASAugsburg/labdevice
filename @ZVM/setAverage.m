function setAverage(obj,average)
%SETAVERAGE Summary of this function goes here
%   Detailed explanation goes here
if average == -1
    obj.write('AVER OFF');
else
    obj.write('AVER:MODE POIN');%
    obj.write(['AVER:COUN ',num2str(average)]);
    obj.write('AVER ON');
end

