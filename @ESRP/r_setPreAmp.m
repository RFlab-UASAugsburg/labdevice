function r_setPreAmp (obj, gain, range)
%
% No idea what this command does.
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
%   gain:       sets the state of the preamp
%               'on'  [String]
%               'off' [String]
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
    switch gain
        case 'on'
            write(obj, ['SCAN', num2str(range), ':INP:GAIN:STAT ', gain, '; *WAI']);
        case 'off'
            write(obj, ['SCAN', num2str(range), ':INP:GAIN:STAT ', gain, '; *WAI']);
        otherwise
            fprintf("parameter 'gain' unclear.\n");
    end
end


end
