function outputDisable(obj)
%OUTPUTDISABLE Disable ALL outputs
%   to individually enable/disable outputs, instead set their current and
%   voltage to zero
    obj.write("OUTP OFF");
end

