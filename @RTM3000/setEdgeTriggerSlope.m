% ====================================================
%> @brief Sets the slope for the edge trigger
%>
%> @param obj Instance of class
%>
%> @param slope Desired trigger slope
%>  available slope strings:
%>                           Rising edge:             'POS'
%>                           Falling edge:            'NEG'
%>                           Rising and falling edge: 'EITH'
%>
% =====================================================

function setEdgeTriggerSlope(obj,slope)
    slopes = {'POS','NEG','EITH'};
    slope = upper(slope);
    if any(strcmp(slopes,slope))
        write(obj,"*WAI; TRIG:A:EDGE:SLOP "+slope);
    else
        error("slope can only be" + string(join(slopes)));
    end 
end