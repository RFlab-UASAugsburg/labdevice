% ====================================================
%> @brief Sets the measuring protocol / the detector mode for final measurement
%>
%> @param obj Instance of class
%> @param detec [character vector] one of 'qpeak','mpeak','aver','cav','crms','neg','rms'
% =====================================================

function setDetectorFME (obj, detec)
    switch lower(detec)
        case 'aver'
            write(obj, ['DET1:FME AVER; *WAI']);
        case 'cav'
            write(obj, ['DET1:FME CAV; *WAI']);
        case 'crms'
            write(obj, ['DET1:FME CRMS; *WAI']);
        case 'neg'
            write(obj, ['DET1:FME NEG; *WAI']);
        case 'mpeak'
            write(obj, ['DET1:FME POS; *WAI']);
        case 'qpeak'
            write(obj, ['DET1:FME QPE; *WAI']);
        case 'rms'
            write(obj, ['DET1:FME RMS; *WAI']);
        otherwise
            error('Detector unbekannt. (detec)');
    end
end