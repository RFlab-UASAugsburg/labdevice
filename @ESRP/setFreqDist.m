function setFreqDist (obj, freqDist)
%
% Sets the space of the frequency to:
%   - auto
%   - linear
%   - logarithmic
%
% !! This will not influence the scale of the x-axis !!
%
%
% Parameters:
%	obj.prop:	labDevice Handle with properties
%            	- mode
%               - address
%               - port
%               - prop.comm(unication)Handle (interface specific)
%
%   freqDist:   'auto' [String]
%               'lin'  [String]
%               'log'  [String]
%
% Return values:
%   /
%
% See also:
%



switch freqDist
    case 'auto'
        writeDev(obj,['SWE:SPAC AUTO; *WAI']);
    case 'lin'
        writeDev(obj,['SWE:SPAC LIN;  *WAI']);
    case 'log'
        writeDev(obj,['SWE:SPAC LOG;  *WAI']);
    otherwise
        disp('Unclear status. (freqDist)');
end


end