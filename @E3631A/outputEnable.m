function outputEnable(obj)
%OUTPUTDISABLE Enable ALL outputs
%   to individually enable/disable outputs, instead set their current and
%   voltage to zero
    obj.write("OUTP ON");
end
