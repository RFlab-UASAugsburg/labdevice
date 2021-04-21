% ====================================================
%> @brief set the FFT windowing type
%>
%> @param obj Instance of class
%>
%> @param type one of these type strings: 'RECT','HAMM','HANN','BLAC','FLAT'
% =====================================================

function setWindowTypeFFT(obj,type)
    types = {'RECT','HAMM','HANN','BLAC','FLAT'};
    type = upper(type);
    if any(strcmp(types,type))
        write(obj,"SPEC:FREQ:WIND:TYPE "+type);
    else
        error("types can only be" + string(join(types)));
    end
end