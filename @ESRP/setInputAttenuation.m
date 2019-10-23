function setInputAttenuation(obj, prot, auto, value)
%
% Sets the input attenuation.
%	'prot' and 'auto' needs to be set.
%	'value' only when automatic attenuation configuration is turned off.
%
% WARNING: To protect the input mixer, the attenuation levels of 10dB or
% less are possible only if the input protection ('prot') is turned off.
%
% This function defines the attenuation level at the RF input.
%
%
% Parameters:
%	obj.prop:	labDevice Handle with properties
%            	- mode
%               - address
%               - port
%               - prop.comm(unication)Handle (interface specific)
%
%   auto:   automatic attenuation configuration
%               'on'   [String]
%               'off'  [String]
%
%   value:  attenuation value
%           	0 dB - 70 dB (increment: 10)
%
%   prot:   attenuation protection
%
%
% Return values:
%   /
%
% See also:
%

switch prot             % turns the input attenuation mode on or off
    case 'on'
        write(obj, ['INP:ATT:PROT ON']);
    case 'off'
        write(obj, ['INP:ATT:PROT OFF']);
    otherwise
        error('Selected mode does not exist. (prot)');
end

switch auto             % turns the automatic attenuation configuration on or off
    case 'on'
        write(obj, ['INP:ATT:AUTO ON; *WAI']);
    case 'off'
        write(obj, ['INP:ATT:AUTO OFF; *WAI']);
        write(obj, ['INP:ATT ', num2str(value), 'dB']); % sets the attenuation value
    otherwise
        error('Selected mode does not exist. (auto)');
end

end