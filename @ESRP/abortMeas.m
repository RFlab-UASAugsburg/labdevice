function abortMeas (obj)
%
% This method stops a measurement.
%   SCAN CONTOL (= commands during the measurement)
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