function r_setStopFreq(obj, freq, range)
%
% Sets the Stop Frequency.
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
%   range:      defines which stop frequency will be set
%               0:      Sets the stop frequency of the whole measurement
%               1-3:    Sets the stop frequency of the range (1 to 3)
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
            write(obj, ['FREQ:STOP ', num2str(freq), 'Hz; *WAI']);
        otherwise
            write(obj, ['SCAN', num2str(range), ':STOP ', num2str(freq), 'Hz; *WAI']);
    end
end

% result = '000000';
% % Abfrage des Operation Complete Bit
% while str2num(result(6)) ~= 1
%     writeDev(obj, '*OPC?');
%     result = readDev(obj);
% end

end