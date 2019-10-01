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
%   detec:      'qpeak'  [character vector] (CISPR 16-1-1)
%               'mpeak'  [character vector]
%               'aver'   [character vector] (CISPR 16-1-1)
%
% Return values:
%   /
%
% See also:
%


switch detec
    case 'qpeak'
        write(obj, ['DET1:FUNC QFE; *WAI']);
    case 'mpeak'
        write(obj, ['DET1:FUNC POS; *WAI']);
    case 'aver'
        write(obj, ['DET1:FUNC AVER; *WAI']);
    otherwise
        error('Detector unbekannt.');
    
  
end

end