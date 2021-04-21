% ====================================================
%> @brief Sets the edge trigger coupling mode
%>
%> @param obj Instance of class
%>
%> @param coupling Desired edge trigger coupling mode
%>  available coupling strings:
%>  DC coupling: 'DC' (trigger signal remains unchanged)
%>  AC coupling: 'AC' (highpass filter removes DC offset voltage from the
%>                     trigger signal)
%>  HF coupling: 'LFR'(15kHz  highpass filter removes lower frequencies
%>                     from the trigger signal. Should only be used with 
%>                     very high frequency signals.)
%>
% =====================================================

function setEdgeTriggerCouplingMode(obj,coupling)
    modes = {'DC','AC','LFR'}; 
    coupling = upper(coupling);
    if any(strcmp(modes,coupling))
        write(obj,"*WAI; TRIG:A:EDGE:COUP "+coupling);
    else
        error("coupling mode can only be" + string(join(modes)));
    end 
end