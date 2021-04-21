% ====================================================
%> @brief Gets the current channel coupling states
%>
%> @param obj Instance of class
%>
% =====================================================
function ChannelCouplingConfig = getChannelCouplingConfig(obj)
    write(obj,":COUP:STAT?");
    message = obj.read; 
    if isempty(message)
            error("no response from device");
    end
    ChannelCouplingConfig = strsplit(message,',');

end