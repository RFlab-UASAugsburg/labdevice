% ====================================================
%> @brief set the frequency step mode of the axis
%> set the mode to
%>   - auto
%>   - linear
%>   - logarithmic
%>
%> !! This will only affect the display axis, not the measurement points !!
%> 
%> @param obj Instance of class
%> @param freqDistAxis [character vector] 'auto','lin','log'
% =====================================================
function setFreqStepModeAxis (obj, freqDistAxis)
	switch freqDistAxis
	    case 'auto'
	        write(obj, ['DISP:TRAC1:X:SPAC AUTO; *WAI']);
	    case 'lin'
	        write(obj, ['DISP:TRAC1:X:SPAC LIN;  *WAI']);
	    case 'log'
	        write(obj, ['DISP:TRAC1:X:SPAC LOG;  *WAI']);
	    otherwise
	        error('Unclear status. (freqDistAxis)');
	end
end