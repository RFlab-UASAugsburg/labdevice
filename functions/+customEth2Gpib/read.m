function ret = read(obj)
%READ Summary of this function goes here
%   Detailed explanation goes here
obj.prop.adapter.write("++read eoi");
pause(0.1);
ret = obj.prop.adapter.read();
end