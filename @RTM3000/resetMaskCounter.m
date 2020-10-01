% ====================================================
%> @brief Resets the counter of passed and failed acquisitions to zero
%>
%> @param obj Instance of class
%>
% =====================================================

function resetMaskCounter(obj)

write(obj,"*WAI; MASK:RES:COUN");

end