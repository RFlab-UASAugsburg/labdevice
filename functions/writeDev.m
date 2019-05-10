function writeDev(object,txt)
% Writes string to Device.
% 
% Write function for interfaces, independent of which interface type is 
% used. Reads the obj.mode property to decide which low level write 
% function is used on the obj.commHandle. 
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
% See also: closeDev, readDev, openDev, closeDev, flushDev, rwDev
% 
% References: 

return 