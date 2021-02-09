% ====================================================
%> @brief Stops acquisition
%>
%> @param obj Instance of class
% =====================================================
function stopAcquisition(obj)
    write(obj,'*WAI; STOP');
end
