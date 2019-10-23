function setMeasTime(obj, mesTim, range)
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
%               1 - 10 [int]
%
% Return values:
%   /
%
% See also:
%

if (range < 1 || range > 10)
	error('Range is not correct (0 to 10)');
else
    write(obj, ['SCAN', num2str(range), ':TIME ', num2str(mesTim), '; *WAI']);
end


end