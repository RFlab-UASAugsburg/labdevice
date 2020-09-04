% ====================================================
%> @brief Sets the trigger offset
%> Note: Can also be seen as the horizontal position
%> @param obj Instance of class
%>
%> @param offset Selected triggeroffset in [s]
%> Note: Depends on time base setting 
%>       Increments of 0.01
% =====================================================

function setTriggerOffset(obj,offset)
if mod(offset,0.01) ~= 0 
    error("Offset has to be in increments of 0.01");
else
    write(obj,"*WAI; TIM:POS "+offset);
end

end