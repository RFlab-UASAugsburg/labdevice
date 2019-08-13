function sinSwe (obj)
%
% Single sweep
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
%
% Return values:
%   /
%
% See also:
%

write(obj, ['INIT2:CONT OFF; *WAI']);

end