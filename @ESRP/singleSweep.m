function singleSweep (obj)
%
% Sets the measurement to single sweep.
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

write(obj, ['INIT2:CONT OFF; *WAI']);

end