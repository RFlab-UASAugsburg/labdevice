function controlDisp (obj, setDisp)
%
% Turns the Display of the ESRP on or off
%
% If the Input is neither 'on' or 'off' a warning will appear in the
% command window.
%
%
% Parameters:
%	obj.prop:	labDevice Handle with properties
%            	- mode
%               - address
%               - port
%               - prop.comm(unication)Handle (interface specific)
%
%   setDisp:   'on'  [String]
%              'off' [String]
%
%
% Return values:
%   /
%
% See also:
%

switch setDisp
    case 'off'
        write(obj, ['SYST:DISP:UPD OFF']);
    case 'on'
        write(obj, ['SYST:DISP:UPD ON']);
    otherwise
        error('Unclear status. (setDisp)');
end

end