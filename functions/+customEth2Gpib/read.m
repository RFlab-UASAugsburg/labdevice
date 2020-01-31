function ret = read(obj)
%READ Summary of this function goes here
%   Detailed explanation goes here
obj.prop.adapter.write("++read eoi");
ret = obj.prop.adapter.read();
end

