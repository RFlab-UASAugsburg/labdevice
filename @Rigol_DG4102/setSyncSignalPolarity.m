% ====================================================
%> @brief Sets the sync signal polarity
%>
%> @param obj Instance of class
%>
%> @param output Selected output
%>
%> @param polarity Desired sync signal polarity
%>  available polarity strings: Positive = 'POS'
%>                              Negative = 'NEG'
%>
% =====================================================

function setSyncSignalPolarity(obj,output,polarity)
if (output == 1 || output == 2)
    polarities = {'POS','NEG'};
    polarity = upper(polarity);
    if any(strcmp(polarities,polarity))
        write(obj,":OUTP"+output+":SYNC:POL "+polarity);
    else
        error("polarity can only be" + string(join(polarities)));
    end
else
    error('Unknown output. Available outputs: 1 or 2');
end
    
end