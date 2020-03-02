function setDetectorFME (obj, detec)
%
% Sets the measuring protocol for final measurement. (qpeak, mpeak, aver)
%
%
%
% Parameters:
%   obj.prop:     labDevice Handle with properties
%                - mode
%                - address
%                - port
%                - prop.comm(unication)Handle (interface specific)
%
%   detec:      'qpeak'  [character vector]
%               'mpeak'  [character vector]
%               'aver'   [character vector]
%		'cav'
%		'crms'
%		'neg'
%		'rms'
%
% Return values:
%   /
%
% See also:
%

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