% ====================================================
%> @brief Get the measurement data from a specific measurement place
%>
%> @param obj Instance of class
%>
%> @param place Selected measurement place
%>
% =====================================================

function MeasurementData = getQuickMeasurementData(obj, place)
    if (place >= 1 && place <= 8)
        write(obj,"MEAS"+place+":RES?; *WAI");
        message = obj.read;
        if isempty(message)
            error("no response from device");
        end
        MeasurementData = str2double(message);
    else
        error("Only measurement places 1..8 are selectable");
    end
    
 end