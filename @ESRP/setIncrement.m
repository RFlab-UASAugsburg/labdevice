function setIncrement (obj, incr, range)
%
% Sets the increment between the measuring points.
%   DEPENDING ON RANGE
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
%   incr:       increment (Schrittweite) [Hz]
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
    write(obj, ['SCAN', num2str(range), ':STEP ', num2str(incr), 'Hz; *WAI']);
    %fprintf('Set the incremente to %.2f Hz\n', incr);
end


end