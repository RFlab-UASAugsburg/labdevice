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

if (range < 0 || range > 10)
	error('range is not correct (1 to 10)');
elseif range == 0
    switch lower(gain)
        case 'on'
            write(obj, "INP:GAIN:STAT ON; *WAI");
        case 'off'
            write(obj, "INP:GAIN:STAT OFF; *WAI");
        otherwise
            error('Parameter not readable. Check the datatyp. (gain)');
    end
else
    switch lower(gain)
        case 'on'
            write(obj, "SCAN" + num2str(range) + ":INP:GAIN:STAT ON;*WAI");
        case 'off'
            write(obj, "SCAN" + num2str(range) + ":INP:GAIN:STAT OFF;*WAI");
        otherwise
            error('Parameter not readable. Check the datatype. (gain)');
    end
end
end
