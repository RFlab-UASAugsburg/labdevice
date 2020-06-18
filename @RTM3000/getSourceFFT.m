% ====================================================
%> @brief Get the source of the FFT
%>
%> @param obj Instance of class
% =====================================================

function FFTSource = getSourceFFT(obj)

    write(obj,"SPEC:SOUR?; *WAI");
    message = obj.read;
    message = strip(message);
    if isempty(message)
        error("no response from device");
    end

    FFTSource = message;

end