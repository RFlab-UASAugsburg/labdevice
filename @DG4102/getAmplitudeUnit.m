% ====================================================
%> @brief gets the amplitude unit
%>
%> also checks if the operation was successful
%>
%> @param obj Instance of class
%> @param source Selected source
% =====================================================


function AmpUnit = getAmplitudeUnit(obj, source)
    write(obj,":SOUR" + source + ":VOLT:UNIT?");
    message = obj.read;
    message = strip(message);
    units = {'DBM','VPP','VRMS'};
    if ~any(strcmp(units,message))
        if isempty(message)
            error("no response from device");
        else
            fprintf(message);
            error("bad message from device");
            
        end
    else
        AmpUnit = message;
    end
end
