function zero(obj) %zero(obj, generator)
%ZERO turn off generator and zero radisense
%   the radisense sensor needs some time for zeroing
	%generator.outputDisable();
    write(obj, "TC"); %random measurement to test if sensor is on
    read(obj);
    write(obj, "ZERO");
    fprintf('%s\n',"Waiting 15 seconds for the zeroing process to finish");
    pause(15);
end
