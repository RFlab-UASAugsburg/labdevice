% ====================================================
%> @brief Gets the configured quick measurement source
%>
%> @param obj Instance of class
%>
%> @param place Selected measurement place
%>
%> @output MeasType Currently configured measurement type
%>
% =====================================================


function MeasSource = getQuickMeasurementSource(obj, place)
write(obj,"*WAI; MEAS"+place+":SOUR?");
message = obj.read;
message = strip(message);
if strlength(message) == 0
    error("no response from device");
end
MeasSource = [{'Measure Source','Measure Source 2'};strsplit(message,',')];
end