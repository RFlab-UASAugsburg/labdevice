% ====================================================
%> @brief Sets the measuring protocol / the detector mode
%>
%> @param obj Instance of class
%> @param detec [character vector] one of 'qpeak','mpeak','aver','cav','crms','neg','rms'
% =====================================================

function setDetector (obj, detec)
    switch lower(detec)
        case 'aver'
            write(obj, ['DET1:REC AVER; *WAI']);
        case 'cav'
            write(obj, ['DET1:REC CAV; *WAI']);
        case 'crms'
            write(obj, ['DET1:REC CRMS; *WAI']);
        case 'neg'
            write(obj, ['DET1:REC NEG; *WAI']);
        case 'mpeak'
            write(obj, ['DET1:REC POS; *WAI']);
        case 'qpeak'
            write(obj, ['DET1:REC QPE; *WAI']);
        case 'rms'
            write(obj, ['DET1:REC RMS; *WAI']);
        otherwise
            error('Detector unbekannt. (detec)');
    end
end