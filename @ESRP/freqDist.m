function setFreqDist (obj, freqDist)
%
% Sets the space of the frequency to:
%   - auto
%   - lin
%   - log
%
% Parameters:
%
%
% Return values:
%
%
% See also:
%

switch freqDist
    case auto
        writeDev(obj,['SWE:SPAC AUTO;*WAI']);
    case lin
        writeDev(obj,['BAND:RES:AUTO ON; *WAI']);
    case log
        writeDev(obj,['']);
    otherwise
        disp('Unclear status. (setBandw)');
end


end