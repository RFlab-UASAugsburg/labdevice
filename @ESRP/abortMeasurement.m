function abortMeasurement (obj)
%
% This method stops a measurement.
%   SCAN CONTOL
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

write(obj, ['ABOR; *WAI']);     % abort

end