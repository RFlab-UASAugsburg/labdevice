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
        write(obj,"*WAI; MEAS"+place+":RES?");
        message = obj.read;
        if strlength(message) == 0
            error("no response from device");
        end
        MeasurementData = str2double(message);
    else
        error("Only measurement places 1..8 are selectable");
    end
    
 end