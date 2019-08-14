function setZF (obj, rbw, range)
%
% Measurement bandwidth used within the scan range. (filter)
%   "r_" stands for "depending on range"
%
% (Here goes the long description)
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
%   rbw:        resolution bandwidth [Hz]
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
    write(obj, ['SCAN', num2str(range), ':BAND:RES ', num2str(rbw), 'Hz; *WAI']);
end


end
