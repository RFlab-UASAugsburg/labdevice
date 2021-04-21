% ====================================================
%> @brief turn the Display of the device on or off
%>
%> @param obj Instance of class
%> @param status 'on' || 'off'
% =====================================================

function controlDisplay (obj, status)
	switch status
	    case 'on'
	        write(obj, ['SYST:DISP:UPD ON']);
	    case 'off'
	        write(obj, ['SYST:DISP:UPD OFF']);
	    otherwise
	        error('Unclear status. (status)');
	end
end