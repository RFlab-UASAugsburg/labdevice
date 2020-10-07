% ====================================================
%> @brief get the FFT windowing type
%>
%> @param obj Instance of class
% =====================================================

function FFTwindowType = getWindowTypeFFT(obj)
    write(obj,"SPEC:FREQ:WIND:TYPE?; *WAI");
    message = obj.read;
    message = strip(message);
    if strlength(message) == 0
        error("no response from device");
    end

    FFTwindowType = message;
end