function continuousSweep (obj)
%
% Sets the measurement to continuous sweep.
%
%
%
% Parameters:
%   obj.prop:     labDevice Handle with properties
%                - mode
%                - address
%                - port
%                - prop.comm(unication)Handle (interface specific)
%
% Return values:
%   /
%
% See also:
%

obj.write("INIT2:CONT ON; *WAI");
obj.write("INIT:CONT ON; *WAI");
end