% ====================================================
%> @brief get the frequency span
%>
%> @param obj Instance of class
%>
%> @return freq in Hz
% =====================================================

function freq = getSpan(obj)
    obj.write("FREQ:SPAN?");
    freq = obj.read;
    if isnan(str2double(freq))
        if isempty(freq)
            error("no message returned from device");
        else
            error("bad message returned from device");
        end
    else
        freq = str2double(freq);
    end
end

