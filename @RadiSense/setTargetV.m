function newPow = setTargetV(rs,gen,targetV,currPow,accuracy)
%SETTARGETV adjusts gen output power to create targetV field strength
%Parameters:
%   rs:         RadiSense handle
%   gen:        Signal Generator handle
%   targetV:    desired field strength in V/m
%   currPow:    starting point for the signal generator power
%   accuracy:   maximal acceptable difference between target and measured
%               field strength
    gen.setPow(currPow);
    pause(0.2);
    readV = 0;
    %get 10 averaged measurements
    for i = 1:10
        readV = readV + rs.getField; 
    end
    readV = readV / 10;
    %test if acceptable field strength has been reached
    
    while abs(readV - targetV) > accuracy 
        fprintf("Current V/m: " + string(readV) + "\n");
        %calculate power needed to reach targetV
        newPow = currPow + 20 * log10(targetV/readV);
        fprintf("Power needed to reach target:" + string(newPow) + "\n");
        %PA maximal input power = 0 dBm
        if newPow <= 0
            gen.setPow(newPow);
            pause(0.2);
            currPow = newPow;
        else
            fprintf("can't reach that level! Please increase PA gain if possible\n");
            return
        end
        readV = 0;
        for i = 1:10
            readV = readV + rs.getField;
        end
        readV = readV / 10;
    end
end