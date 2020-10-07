% ====================================================
%> @brief get the FFT start frequency
%>
%> @param obj Instance of class
% =====================================================

function StartFreqFFT = getStartFreqFFT(obj)
    write(obj,"SPEC:FREQ:STAR?; *WAI");
    message = obj.read;
    message = strip(message);
    if strlength(message) == 0
        error("no response from device");
    end

    StartFreqFFT = message;
end