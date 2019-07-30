function setIncr (obj, incr)
%
% Sets the increment between the meassuring points.
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
%   incr:    increment (Schrittweite) [Hz]
%
% Return values:
%   /
%
% See also:
%

writeDev(obj, ['SCAN1:STEP ', num2string(incr), 'Hz; *WAI']);
