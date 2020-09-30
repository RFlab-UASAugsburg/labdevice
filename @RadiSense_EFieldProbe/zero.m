% ======================================================================
%> @brief zero the probe
%>
%> before useful measurements can be taken, the sensor has to be zeroed. This process takes 15 seconds.
%>
%> @param obj Instance of RadiSense_EFieldProbe class
% ======================================================================
function zero(obj) %zero(obj, generator)
    write(obj, "TC"); %random measurement to test if sensor is on
    read(obj);
    write(obj, "ZERO");
    fprintf('%s\n',"Waiting 15 seconds for the zeroing process to finish");
    pause(15);
end
