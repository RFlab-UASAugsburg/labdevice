function ret=write(obj,txt)
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
%  ret:         1 if it was successfull.
%
% See also: gpib.open, gpib.close, gpib.read
%
% References:

fprintf(obj.prop.commHandle,txt);

ret=1;
return