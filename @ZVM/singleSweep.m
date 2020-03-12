function singleSweep(obj)
%SINGLESWEEP set device to single sweep mode
%   obj instance of ZVM clas
obj.write('INIT:CONT OFF');
end

