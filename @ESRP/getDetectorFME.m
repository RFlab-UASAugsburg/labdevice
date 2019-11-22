function detector = getDetectorFME(obj,varargin)
%GETDETECTOR get currently set detector for final measurement
%   returns char arrays of the format used in setDetector
% Parameters:
%   obj.prop:     labDevice Handle with properties
%                - mode
%                - address
%                - port
%                - prop.comm(unication)Handle (interface specific)
% Return values:
%   detector:   'qpeak'
%               'mpeak'  
%               'aver'
%               'cav'
%               'crms'
%               'neg'
%               'rms'
    if ~isempty(varargin)
        det_num = varargin{1};
    else
        det_num = 1;
    end
    obj.write("DET"+det_num+":FME?");
    detector = lower(strip(obj.read)); 
    switch detector
    case 'pos'
        detector = 'mpeak';
    case 'qpe'
        detector = 'qpeak';
    end
end

