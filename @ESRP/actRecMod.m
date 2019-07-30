function actRecMod (obj)
%
% Activate the Receiver Mode (ESRP)
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
%
% Return values:
%   /
%
% See also:
%

write(obj, ['INST REC; *WAI']);


end