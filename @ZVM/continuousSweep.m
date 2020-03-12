function continuousSweep(obj)
%CONTINUOUSSWEEP set device to continuous sweep mode
%   obj Instance of ZVM class
obj.write('INIT:CONT ON');
end

