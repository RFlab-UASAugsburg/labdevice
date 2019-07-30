function setAutBandw (obj, setBandw)
%
% Enables of disables the automatic bandwidth setting.
%
%
%
% Parameters:
%	obj.prop:	labDevice Handle with properties
%            	- mode
%            	- address
%            	- port
%            	- prop.comm(unication)Handle (interface specific)
%
%   setBandw:   'on'  [String]
%               'off' [String]
%
% Return values:
%   /
%
% See also:
%

switch setBandw
    case 'off'
        writeDev(obj,['BAND:RES:AUTO OFF; *WAI']);
    case 'on'
        writeDev(obj,['BAND:RES:AUTO ON;  *WAI']);
    otherwise
        disp('Unclear status. (setBandw)');
end


end