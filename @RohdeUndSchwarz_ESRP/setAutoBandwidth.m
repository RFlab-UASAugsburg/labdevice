% ====================================================
%> @brief enable or disable automatic resolution bandwith
%>
%> @param obj Instance of class
%> @param setBandw 'on' || 'off'
% =====================================================

function setAutoBandwidth (obj, setBandw)
	switch setBandw
	    case 'off'
	        write(obj, ['BAND:RES:AUTO OFF; *WAI']);
	    case 'on'
	        write(obj, ['BAND:RES:AUTO ON;  *WAI']);
	    otherwise
	        error('Unclear status. (setBandw)');
	end
end