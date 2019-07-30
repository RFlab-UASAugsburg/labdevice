function setDetector (obj, detec)
%
% Sets the meassuring protocol. (qpeak, mpeak, aver)
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
%   detec:      'qpeak'  [String]
%               'mpeak'  [String]
%               'aver'   [String]
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
        write(obj, ['DET1:FUNC AVER; *WAI'];
    otherwise
        disp('Detector unbekannt.');
    
  
end
end