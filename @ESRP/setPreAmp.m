function setPreAmp (obj, gain, range)
%
% No idea what this command does.
%   DEPENDING ON RANGE
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
%   gain:       sets the state of the preamp
%               'on'  [String]
%               'off' [String]
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
	error('range is not correct (1 to 10)');
else
    switch gain
        case 'on'
            write(obj, ['SCAN', num2str(range), ':INP:GAIN:STAT ', gain, '; *WAI']);
        case 'off'
            write(obj, ['SCAN', num2str(range), ':INP:GAIN:STAT ', gain, '; *WAI']);
        otherwise
            error('Parameter not readable. Check the datatyp. (gain)');
    end
end


end
