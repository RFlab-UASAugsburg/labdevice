function sc_resumMeas (obj)
%
% This method resumes the measurement.
%	"sc_" stands for "scan contol" and is debugging relevant.
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

write(obj, ['INIT:IMM; *WAI']); % restart

end