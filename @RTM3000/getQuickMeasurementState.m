% ====================================================
%> @brief Gets the configured measurement place state
%>
%> @param obj Instance of class
%>
%> @param place Selected measurement place
%>
%> @output state Currently configured measurement place state
%>
% =====================================================


function state = getQuickMeasurementState(obj, place)
write(obj,"*WAI; MEAS"+place+":ENAB?");
message = obj.read;
message = strip(message);
if isempty(message)
    error("no response from device");
end
state = message;
end