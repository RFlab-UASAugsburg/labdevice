function setFreqDistAxis (obj, freqDistAxis)
%
% Sets the frequency distance of the x-axis to: auto, lin, log
% (not the meassuring porints!)
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
%   freqDistAxis:   'auto' [String]
%                   'lin'  [String]
%                   'log'  [String]
%
% Return values:
%   /
%
% See also:
%

switch freqDistAxis
    case 'auto'
        write(obj,['DISP:TRAC1:X:SPAC AUTO; *WAI']);
    case 'lin'
        write(obj,['DISP:TRAC1:X:SPAC LIN;  *WAI']);
    case 'log'
        write(obj,['DISP:TRAC1:X:SPAC LOG;  *WAI']);
    otherwise
        disp('Unclear status. (freqDistAxis)');
end


end