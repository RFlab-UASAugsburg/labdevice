% ======================================================================
%> @brief reset the device
%>
%> also re-enables the display for convenience.
%>
%> @param obj Instance of class
% ======================================================================

function reset (obj)
	write(obj, ['*RST;*CLS; *WAI']);        % reset
	write(obj, ['SYST:DISP:UPD ON']);       % turn display on again (bec. of remote-mode)
end