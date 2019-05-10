function obj=openDev(obj)
%obj=openDev(obj) opens some stuff
%   
%obj=openDev(obj)
%
%   See also readDev,
%   Copyright 2019-2022 The BohnertAletseeWorks, Inc.
%   References:
%     Nix


switch(obj.prop.mode)
    case 'eth'
        obj=eth.open(obj);
    case 'gpib'
        gpib.open(obj)
    case 'eth2gpib'
        error('openDev:Not implemented yet');
    case 'serial'
        error('openDev:Not implemented yet');
    case 'eth2serial' 
        error('openDev:Not implemented yet');
    otherwise
        error('openDev:Unknown mode');            
end

end