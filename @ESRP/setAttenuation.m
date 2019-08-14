function setAttenuation(obj, attVal, range)
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
%   attVal:     attenuation value [dB]
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
    write(obj, ['SCAN', num2str(range), ':INP:ATT ', num2str(attVal), 'dB; *WAI']);
end


end