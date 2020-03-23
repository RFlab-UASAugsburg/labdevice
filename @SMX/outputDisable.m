% ====================================================
%> @brief Disable the output of signal generator
%>
%> @param obj Instance of class
% =====================================================
function outputDisable(obj)
%   setting the level to "OFF" disables the output
write(obj, "L:OFF");
end

