function setStopFreq(obj, freq)
%
% Sets the Stop Frequency.
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
% Return values:
%   /
%
% See also:
%

writeDev(obj, ['FREQ:STOP ', num2str(freq), 'Hz; *WAI']);

% result = '000000';
% % Abfrage des Operation Complete Bit
% while str2num(result(6)) ~= 1
%     writeDev(obj, '*OPC?');
%     result = readDev(obj);
% end

end