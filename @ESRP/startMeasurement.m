function startMeasurement(obj)
%
% This method starts the measurement.
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

write(obj, ['INIT2:IMM; *WAI']); % start

end