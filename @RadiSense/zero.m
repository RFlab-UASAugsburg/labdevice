function zero(obj) %zero(obj, generator)
%ZERO turn off generator and zero radisense
%   the radisense sensor needs some time for zeroing
	%generator.outputDisable();
    write(obj, "TC"); %random measurement to test if sensor is on
    read(obj);
    write(obj, "ZERO");
    pause(15); %Wait for zeroing process to finish, no exact time is known so far
end
