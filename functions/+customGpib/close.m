function obj=close(obj)
% Closes a GPIB connection.
% 
% Closes a VISA (gpib) interfaces. 
%  
%
%  obj:         labDevice Handle with properties
%               obj.prop.
%                - mode
%                - address
%                - port
%                - comm(unication)Handle (interface specific)
%                - gpib.primaryAdress
%                - gpib.vendor
%                - gpib.boardIndex
%
%
% Return values:
%  obj:         lab Device Handle with properties
%               obj.prop.
%                - mode
%                - address
%                - port
%                - comm(unication)Handle (interface specific)
%                - gpib.primaryAdress
%                - gpib.boardIndex
%
% See also: gpib.open, gpib.write, gpib.read
%
% References:

fclose(obj.prop.commHandle);

return