% ====================================================
%> @brief set the FFT stop frequency
%>
%> @param obj Instance of class
%> @param freq desired FFT stop frequency note: Depends on time
%base,span/RBW ratio,center frequency
% =====================================================

function setStopFreqFFT(obj,freq)
  if isnumeric(freq)
    write(obj,"SPEC:FREQ:STOP "+freq);
  else
      error("unknown frequency input");
  end

end