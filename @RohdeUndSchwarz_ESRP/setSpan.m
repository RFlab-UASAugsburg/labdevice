% ====================================================
%> @brief set the frequency span
%>
%> @param obj Instance of class
%> @param freq as double in Hz or as string with unit (e.g. '1 GHz')
% =====================================================

function setSpan(obj,span)
    obj.write("FREQ:SPAN " + span);
end

