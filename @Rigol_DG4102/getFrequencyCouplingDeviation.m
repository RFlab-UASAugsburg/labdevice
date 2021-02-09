% ====================================================
%> @brief Gets the frequency coupling deviation
%>
%> @param obj Instance of class
%>
%> @output frequencyCouplingDeviation Current frequency coupling deviation
% =====================================================

function frequencyCouplingDeviation = getFrequencyCouplingDeviation(obj)
write(obj,":COUP:FREQ:DEV?");
message = obj.read;
message = strip(message);
if isempty(message)
    error("no response from device");
end
frequencyCouplingDeviation = message;  
end