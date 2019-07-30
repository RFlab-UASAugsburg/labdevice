function setPow(obj,pow)
%
% Set powerlevel of the SMX.
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
%  pow:          power level [dBm]
%
%
% See also: setFreq
% 
% References:


if pow > 0 % SMX Specific
    fprintf('Power Level too high!\n');
    return
end

write(obj, ['L ', num2str(pow)]);

end