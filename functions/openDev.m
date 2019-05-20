function obj=openDev(obj)
% Opens connection to Device.
% 
% Open function for interfaces, independent of which interface type is 
% used. Reads the obj.mode property to decide which low level open 
% function is used to fill the obj.commHandle. 
%
% Parameters:
%  obj:         labDevice Handle with properties
%                - mode
%                - address
%                - port
%                - comm(unication)Handle (interface specific)
%
% Return values:
%  obj:         lab Device Handle with properties
%                - mode
%                - address
%                - port
%                - comm(unication)Handle (interface specific)
%
% See also: closeDev, writeDev, readDev, closeDev, flushDev, rwDev
% 
% References: 


switch(obj.prop.mode)
    case 'eth'
        obj=customEth.open(obj);
    case 'gpib'
        obj=customGpib.open(obj);
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