% ====================================================
%> @brief Sets the increment between the measuring points.
%>
%>   DEPENDING ON RANGE
%> 
%> NOTE: The frequency stepsize for TIME DOMAIN SCANS (R&S RohdeUndSchwarz_ESRP-K53) is always selected automatically.
%>       Only needed when timeDomainScan.m is turned off.
%>
%> Frequency stepsize within the scan range.
%> If you define a stepsize that is larger than the range itself,
%> the R&S RohdeUndSchwarz_ESRP only measures the start and stop frequencies of the scan range.
%> The step size is available if the Step Mode is either linear or logarithmic.
%>
%> If the step mode is linear, the step size is a value in Hz.
%> If the step mode is logarithmic, the step size is a per- centage.
%>
%> @param obj Instance of class
%> @param stepSize in Hz if (stepMode == 'lin'); in % if (stepMode == 'log')
%> @param range scan range index [1..10]
% =====================================================

function setFreqStepSize(obj, stepSize, range)
	if (range < 1 || range > 10)
		error('Range is not correct. (1 to 10)');
	else
	    write(obj, ['SCAN', num2str(range), ':STEP ', num2str(stepSize), 'Hz; *WAI']);
	    %fprintf('Set the incremente to %.2f Hz\n', stepSize);
	end
end
