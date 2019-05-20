function obj=opn(obj)
% Opens a GPIB connection.
% 
% Opens a VISA (gpib) interfaces. Writes the handle in obj.commHandle.
%  
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
% See also: gpib.close, gpib.write, gpib.read
%
% References:

obj.prop.commHandle = visa('agilent', ['GPIB',num2str(obj.prop.gpib.boardIndex),'::',num2str(obj.prop.gpib.primaryAdress),'::INSTR']);
fopen(obj.prop.commHandle);

return