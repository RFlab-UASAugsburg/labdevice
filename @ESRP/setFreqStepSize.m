function setFreqStepSize(obj, stepSize, range)
%
% Sets the increment between the measuring points.
%   DEPENDING ON RANGE
% 
% Note that the frequency stepsize for TIME DOMAIN SCANS (R&S ESRP-K53) is always selected automatically.
%
% Frequency stepsize within the scan range.
% If you define a stepsize that is larger than the range itself,
% the R&S ESRP only measures the start and stop frequencies of the scan range.
% The step size is available if the Step Mode is either linear or logarithmic.
%
% If the step mode is linear, the step size is a value in Hz.
% If the step mode is logarithmic, the step size is a per- centage.
%
%
% Parameters:
%   obj.prop:    labDevice Handle with properties
%                  - mode
%                  - address
%                  - port
%                  - prop.comm(unication)Handle (interface specific)
%
%   stepSize:	increment (Schrittweite)
%                 [Hz] -> stepMode = 'lin'
%                 [%]  -> stepMode = 'log'
%
%   range:      choose the range
%               1 - 10 [int]
%
% Return values:
%   /
%
% See also:
%

if (range < 0 || range > 10)
	error('range is not correct (0 to 10)');
else
    write(obj, ['SCAN', num2str(range), ':STEP ', num2str(stepSize), 'Hz; *WAI']);
    %fprintf('Set the incremente to %.2f Hz\n', stepSize);
end


end
