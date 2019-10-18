function setFreqStepSpace(obj, mode)
%
% Sets the mode of the Step Space.
%   DEPENDING ON RANGE
% 
% Note that the frequency step space for TIME DOMAIN SCANS (R&S ESRP-K53) is always selected automatically.
%
%
% Parameters:
%   obj.prop:    labDevice Handle with properties
%                  - mode
%                  - address
%                  - port
%                  - prop.comm(unication)Handle (interface specific)
%
%   mode:   	lin [String]
%               log [String]
%
% Return values:
%   /
%
% See also:
%

switch  mode
    case 'lin'
        write(obj, ['SWE:SPAC LIN; *WAI']);
    case 'log'
        write(obj, ['SWE:SPAC LOG; *WAI']);
    otherwise
        error('Selected mode does not exist');
end
    


end
