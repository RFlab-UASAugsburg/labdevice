% ====================================================
%> @brief set the frequency step mode
%> set the mode to
%>   - auto
%>   - linear
%>   - logarithmic
%>
%> !! This will not influence the scale of the x-axis !!
%> 
%> @param obj Instance of class
%> @param freqDist [character vector] 'auto','lin','log'
% =====================================================
function setFreqStepMode (obj, freqDist)
	switch freqDist
	    case 'auto'
	        write(obj,['SWE:SPAC AUTO; *WAI']);
	    case 'lin'
	        write(obj,['SWE:SPAC LIN;  *WAI']);
	    case 'log'
	        write(obj,['SWE:SPAC LOG;  *WAI']);
	    otherwise
	        error('Unclear status. (freqDist)');
	end
end