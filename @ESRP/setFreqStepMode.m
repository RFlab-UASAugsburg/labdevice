function setFreqStepMode (obj, freqDist)
%
% Sets the step mode of the frequency to:
%   - auto
%   - linear
%   - logarithmic
%
% !! This will not influence the scale of the x-axis !!
%
% 
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
        write(obj,['SWE:SPAC AUTO; *WAI']);
    case 'lin'
        write(obj,['SWE:SPAC LIN;  *WAI']);
    case 'log'
        write(obj,['SWE:SPAC LOG;  *WAI']);
    otherwise
        error('Unclear status. (freqDist)');
end


end