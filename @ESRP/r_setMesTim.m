function r_setMesTim(obj, mesTim, range)
%
% Sets the measuring time.
%   "r_" stands for "depending on range"
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
	fprintf("range is not correct (0 to 3)\n");
else
    write(obj, ['SCAN', num2str(range), ':TIME ', num2str(mesTim), '; *WAI']);
end


end