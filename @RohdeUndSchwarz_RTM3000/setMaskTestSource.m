% ====================================================
%> @brief Defines the channel to be compared with the mask also the channel
%>        from which the mask is created
%>
%> @param obj Instance of class
%>
%> @param source Desired trigger source
%>  available source strings: 'CH1','CH2','CH3','CH4'
%>
% =====================================================

function setMaskTestSource(obj,source)
    sources = {'CH1','CH2','CH3','CH4'};
    source = upper(source);
    if any(strcmp(sources,source))
        write(obj,"*WAI; MASK:SOUR "+source);
    else
        error("source can only be" + string(join(sources)));
    end 
end