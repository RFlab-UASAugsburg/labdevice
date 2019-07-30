function resetESRP (obj)
% 
% Resets the ESRP
%
% The ESRP will be reseted and because of switching into the remote mode,
% the display will be turned on again.
%
%
% Parameters:
%	obj.prop:	labDevice Handle with properties
%            	- mode
%               - address
%               - port
%               - prop.comm(unication)Handle (interface specific)
%
% Return values:
%   /
%
% See also:
%

write(obj, ['*RST;*CLS; *WAI']);        % reset
write(obj, ['SYST:DISP:UPD ON']);       % turn display on again (bec. of remote-mode)


end