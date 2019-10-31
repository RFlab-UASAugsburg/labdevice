function timeDomainScan(obj, mode)
%
% Sets the mode of the Step Space.
%   DEPENDING ON RANGE
% 
% Note that the frequency step space for TIME DOMAIN SCANS (R&S ESRP-K53)
% is always selected automatically.
%
% If the time domain scan is turned off, the frequency step size is set to logarithmic.
% It can be changed to linear using the setFreqStepSpace.m function
%
%
% Parameters:
%   obj.prop:    labDevice Handle with properties
%                  - mode
%                  - address
%                  - port
%                  - prop.comm(unication)Handle (interface specific)
%
%   mode:   	on  [String]
%               off [String]
%
% Return values:
%   /
%
% See also:
%   setFreqStepSpace.m
%

switch mode
    case 'on'
        write(obj, 'FREQ:MODE TDOM');
    case 'off'
        write(obj, 'FREQ:MODE SCAN');
        write(obj, 'SWE:SPAC LOG');     % sets the frequency step size as default to logarithmic.
    otherwise
        error('Selected mode does not exist');
end