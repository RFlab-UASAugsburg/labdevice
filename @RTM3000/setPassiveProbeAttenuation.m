% ====================================================
%> @brief Sets the passive probe attenuation of the selected channel
%>
%> @param obj Instance of class
%>
%> @param channel Selected channel
%>
%> @param att Selected attenuation or gain
%>
% =====================================================

function setPassiveProbeAttenuation(obj,channel,att)
    if channel < 1 || channel > 4
        error("Channel can only be between 1-4");
    else
        if att < 0.001 || att > 10000
            error("Attenuation/Gain can only be between 0.001-10000");
        else
            write(obj,"PROB"+channel+":SET:ATT:MAN "+att);
        end 
    end
end