% ====================================================
%> @brief pause/hold the current measurement
%> 
%> @param obj Instance of class
% =====================================================


function holdMeas (obj)
	write(obj, ['HOLD; *WAI']);
end