function continueMeas(obj)
%
% This method continues the measurement at the frequency it was interrupted.
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

write(obj, ['INIT2:CONM; *WAI']); % resume

end