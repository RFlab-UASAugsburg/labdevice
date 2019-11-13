function setDetector (obj, detec)
%
% Sets the measuring protocol. (qpeak, mpeak, aver)
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


switch detec
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
        write(obj, ['DET1:REC QFE; *WAI']);
    case 'rms'
        write(obj, ['DET1:REC RMS; *WAI']);
    otherwise
        error('Detector unbekannt. (detec)');
    
  
end

end