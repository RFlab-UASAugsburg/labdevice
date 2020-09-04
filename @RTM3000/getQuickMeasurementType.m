% ====================================================
%> @brief Gets the configured quick measurement type
%>
%> @param obj Instance of class
%>
%> @param place Selected measurement place
%>
%> @output MeasType Currently configured measurement type
%>
% =====================================================


function MeasType = getQuickMeasurementType(obj, place)
write(obj,"*WAI; MEAS"+place+":MAIN?");
message = obj.read;
message = strip(message);
if isempty(message)
    error("no response from device");
end
MeasType = message;
end