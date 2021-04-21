% ====================================================
%> @brief set the channel acquisition type
%>
%> @param obj Instance of class
%>
%> @param type one of these type strings:
%>  Sampling:        'SAMP'
%>  Peak Detect:     'PDET'
%>  High Resolution: 'HRES'
% =====================================================

function setAcquisitionType(obj,type)
    types = {'SAMP','PDET','HRES'};
    type = upper(type);    
        if any(strcmp(types,type))
            write(obj,"*WAI; CHAN:TYPE "+type);
        else
            error("types can only be" + string(join(types)));
        end
end