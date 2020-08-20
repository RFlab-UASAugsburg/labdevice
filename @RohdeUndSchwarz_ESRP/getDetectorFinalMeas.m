% ====================================================
%> @brief get the currently set detector for final measurement
%>
%> detector strings:
%>               'qpeak'
%>               'mpeak'
%>               'aver'
%>               'cav'
%>               'crms'
%>               'neg'
%>               'rms
%>
%> @param obj Instance of class
%> @param varargin detector number. Defaults to 1 if left empty.
%>
%> @return detector (char array) the set detector in above format
% =====================================================

function detector = getDetectorFinalMeas(obj,varargin)
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

