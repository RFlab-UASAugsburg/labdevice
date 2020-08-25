% ====================================================
%> @brief Sets the channel polarity of the selected channel
%>
%> @param obj Instance of class
%>
%> @param channel Selected channel
%>
%> @param polarity Selected polarity
%>
%>  available polarity strings:
%>  Normal:   'NORM'
%>  Inverted: 'INV'
%>
% =====================================================

function setChannelPolarity(obj,channel,polarity)
    types = {'NORM','INV'};
    polarity = upper(polarity);
    if channel < 1 || channel > 4
        error("Channel can only be between 1-4");
    else
        if any(strcmp(types,polarity))
            write(obj,"CHAN"+channel+":POL "+polarity);
        else
            error("coupling mode can only be" + string(join(types)));
        end 
    end
end