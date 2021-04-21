% ====================================================
%> @brief get the FFT stop frequency
%>
%> @param obj Instance of class
% =====================================================

function StopFreqFFT = getStopFreqFFT(obj)
    write(obj,"SPEC:FREQ:STOP?; *WAI");
    message = obj.read;
    message = strip(message);
    if strlength(message) == 0
        error("no response from device");
    end

    StopFreqFFT = message;
end