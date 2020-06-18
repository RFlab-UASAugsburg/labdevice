% ====================================================
%> @brief set the FFT start frequency
%>
%> @param obj Instance of class
%> @param freq desired FFT start frequency note: Depends on time
%base,span/RBW ratio,center frequency
% =====================================================

function setStartFreqFFT(obj,freq)
  if isnumeric(freq)
    write(obj,"SPEC:FREQ:STAR "+freq);
  else
      error("unknown frequency input");
  end

end