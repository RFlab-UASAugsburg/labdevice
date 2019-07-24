function resetESRP (obj)
% 
% Resets the ESRP
%
% The ESRP will be reseted and because of switching into the remote mode,
% the display will be turned on again.
%
%
% Parameters:
%
%
% Return values:
%
%
% See also:
%

writeDev(obj, ['*RST;*CLS;*WAI']);
writeDev(obj, ['SYST:DISP:UPD ON']);


end