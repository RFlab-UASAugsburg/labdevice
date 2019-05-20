function ret=write(obj,txt)
% Writes txt via GPIB connection to object.
% 
% Writes over a VISA (gpib) interfaces. 
%  
% Parameters:
%  obj:         labDevice Handle with properties
%               obj.prop.
%                - mode
%                - address
%                - port
%                - comm(unication)Handle (interface specific)
%                - gpib.primaryAdress
%                - gpib.vendor
%                - gpib.boardIndex
%  txt:         text that is send to device
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