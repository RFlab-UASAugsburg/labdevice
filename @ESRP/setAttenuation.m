function setAttenuation(obj, value, range)
%
% Sets the attenuation for the different ranges.
%   DEPENDING ON RANGE
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
%   value:      attenuation value [dB]
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
	error('Range is not correct. (1 to 10)');
else
    write(obj, ['SCAN', num2str(range), ':INP:ATT ', num2str(value), 'dB; *WAI']);
end


end