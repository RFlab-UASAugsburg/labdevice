function contrDisp (obj, setDisp)
%
%
% (long description goes here)
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

switch (setDisp)
    case 'off'
        writeDev(obj, ['SYST:DISP:UPD OFF']);
    case 'on'
        writeDev(obj, ['SYST:DISP:UPD ON']);
    otherwise
        disp('Unclear status. (setDisp)');
end





end