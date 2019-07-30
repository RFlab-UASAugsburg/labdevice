function setDetector (obj, detector)
%
% Activate the Receiver Mode (ESRP)
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
%   detector:   'qpeak'  [String]
%               'mpeak'  [String]
%               'aver'   [String]
%
% Return values:
%   /
%
% See also:
%


switch
    case 'qpeak'
        writeDev(obj, ['DET1:FUNC QFE;*WAI']);
    case 'mpeak'
        writeDev(obj, ['DET1:FUNC POS;*WAI']);
    case 'aver'
        writeDev(obj, ['DET1:FUNC AVER;*WAI'];
    otherwise
        disp('Detector unbekannt.');
    
  
end
end