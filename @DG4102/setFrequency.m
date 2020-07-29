% ====================================================
%> @brief Sets the frequency of the basic waveform
%>
%> @param obj Instance of class
%>
%> @param output Selected output
%>
%> @param amplitude Desired frequency in [Hz]
%> Note: Different waveforms correspond to different frequency ranges.
%> Sine:     1 ?Hz to 100 MHz
%> Square:   1 ?Hz to 40 MHz
%> Ramp:     1 ?Hz to 3 MHz
%> Pulse:    1 ?Hz to 25 MHz
%> Arb:      1 ?Hz to 25 MHz 
%> Harmonic: 1 ?Hz to 50 MHz 
%> Noise:    80 Mhz bandwidth
%>
% =====================================================

function setFrequency(obj,output,frequency)
if (output == 1 || output == 2)
    write(obj,":SOUR"+output+":FREQ "+frequency);
else
    error('Unknown output. Available outputs: 1 or 2');
end
    
end