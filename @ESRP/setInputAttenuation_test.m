function setInputAttenuation_test(obj, attSta, attVal)
%
% Sets the input attenuation. Input Attenuation Protector
%
% This function defines the attenuation level at the RF input.
% Either the attenuation will be turned off or it will be set between 0 dB
% and 75 dB (increment: 5 dB).
%
%
% Parameters:
%	obj.prop:	labDevice Handle with properties
%            	- mode
%               - address
%               - port
%               - prop.comm(unication)Handle (interface specific)
%
%   attSta:     attenuation state
%                 'on'   [String]
%                 'off'  [String]  ? 10 dB (0 - 10 dB)
%
%   attVal:     attenuation value
%                 0 dB - 75 dB (increment: 5)
%
%
% Return values:
%   /
%
% See also:
%


switch attSta
    case 'on'
        write(obj, ['INP:ATT:PROT ON; *WAI']);
        write(obj, ['INP:ATT ', num2str(attVal), 'dB']);
        %fprintf('Input attenuation protector set: on\nValue: %d dB\n', attVal);
    
    case 'off'
        write(obj, ['INP:ATT:PROT OFF; *WAI']);
        %fprintf('Input attenuation protector set: off\nValue: 0 dB - 10 dB\n');
    otherwise
        error('Attenuation state unclear. (attSta)');
end

end