% ====================================================
%> @brief Set the source for the FFT
%>
%> @param obj Instance of class
%>
%> @param source selected channel as FFT source, e.g. "CH1","CH2",...
% =====================================================

function setSourceFFT(obj, source)
    sourceUP = upper(source);
         switch sourceUP
            case 'CH1'
                write(obj,"SPEC:SOUR CH1");
            case 'CH2'
                write(obj,"SPEC:SOUR CH2");
            case 'CH3'
                write(obj,"SPEC:SOUR CH3");    
            case 'CH4'
                write(obj,"SPEC:STAT CH4");
            otherwise
                error('Unclear source. Possible inputs: CH1 | CH2 | CH3 | CH4 ' +source);
         end      
end
