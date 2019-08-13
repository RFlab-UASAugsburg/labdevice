function r_setStartFreq(obj, freq, range)
%
% Sets the start frequency.
%   "r_" stands for "depending on range"
%
% (long description goes here)
%
%
% Parameters:
%	obj.prop:	labDevice Handle with properties
%            	- mode
%               - address
%               - port
%               - prop.comm(unication)Handle (interface specific)
%
%   freq:       frequency [Hz]
%
%   range:      defines which start frequency will be set
%               0:      Sets the start frequency of the whole measurement
%               1-3:    Sets the start frequency of the range (1 to 3)
%
% Return values:
%   /
%
% See also:
%

if (range < 0 || range > 3)
    error('range is not correct (0 to 3)');
else
    switch range
        case 0
            write(obj, ['FREQ:STAR ', num2str(freq), 'Hz; *WAI']);
        otherwise
            write(obj, ['SCAN', num2str(range), ':STAR ', num2str(freq), 'Hz; *WAI']);
    end
end



% result = '000000';
% % Abfrage des Operation Complete Bit
% while str2num(result(6)) ~= 1
%     writeDev(obj, '*OPC?');
%     result = readDev(obj);
% end

end