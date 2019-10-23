function setFreqStepSpace(obj, mode)
%
% Sets the mode of the Step Space.
% 
% Note that the frequency step space for TIME DOMAIN SCANS (R&S ESRP-K53)
% is always selected automatically!
%
% In order to set the frequency step space manually, the time domain scan
% must be switched off. Use the setTimeDomainScan.m function to do this.
%
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
%   setTimeDomainScan.m
%

switch  mode
    case 'lin'
        write(obj, ['SWE:SPAC LIN; *WAI']);     % set to linear
    case 'log'
        write(obj, ['SWE:SPAC LOG; *WAI']);     % set to logarithmic
    otherwise
        error('Selected mode does not exist. (mode)');
end
    


end
