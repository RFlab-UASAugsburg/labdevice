function zero(obj) %zero(obj, generator)
%ZERO turn off generator and zero radisense
%   the radisense sensor needs some time for zeroing
	%generator.outputDisable();
    write(obj, "TC"); %random measurement to test if sensor is on
    if read(obj) == ":E9"
        fprintf("Sensor is not connected (LASER is off)");
        return
    end
    write(obj, "AEEE"); %enable all axis'
    obj.setRange(1);
    write(obj, "ZERO");
    pause(15); %Wait for zeroing process to finish, no exact time is known so far
end
