function setFreq(obj, freq)
%
% Set frequency of the SMX.
% 
% (long description goes here)
%
% Parameters:
%	obj.prop:     labDevice Handle with properties
%                - mode
%                - address
%                - port
%                - prop.comm(unication)Handle (interface specific)
%
%  freq:          frequency [Hz]
%
%
% See also: setFreq
% 
% References:

write(obj, ['RF ', num2str(freq)]);


% result = '000000';
% % Abfrage des Operation Complete Bit
% while str2num(result(6)) ~= 1
%     writeDev(obj, '*OPC?');
%     result = readDev(obj);
% end

end