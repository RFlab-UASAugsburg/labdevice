function setMeasuringTime(obj, mesTim, range)
%
% Sets the measuring time.
%   DEPENDING ON RANGE
%
% Defines the measurement time per point (frequency).
% Default is: 50e-3 [s]
%
%
% Parameters:
%	obj.prop:	labDevice Handle with properties
%            	- mode
%               - address
%               - port
%               - prop.comm(unication)Handle (interface specific)
%
%   mesTim:     measuring time [s]
%
%   range:      choose the range
%               1 - 3 [int]
%
% Return values:
%   /
%
% See also:
%

if (range < 0 || range > 3)
	error('range is not correct (0 to 3)');
else
    write(obj, ['SCAN', num2str(range), ':TIME ', num2str(mesTim), '; *WAI']);
end


end