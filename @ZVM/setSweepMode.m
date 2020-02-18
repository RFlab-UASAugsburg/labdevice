function setSweepMode(obj,mode)
%SETSWEEPMODE Summary of this function goes here
%   Detailed explanation goes here
    switch mode
        case 'cont'
            obj.write('INIT:CONT ON');
        case 'single'
            obj.write('INIT:CONT OFF');
        otherwise
            error("incorrect mode");
    end
end

