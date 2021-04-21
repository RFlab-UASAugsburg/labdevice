% ====================================================
%> @brief get the current center frequency of RohdeUndSchwarz_ESRP
%>
%> @param obj Instance of class
%> @return freq center Frequency in Hz
% =====================================================

function freq = getCenterFreq(obj)
    obj.write("FREQ:CENT?");
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

