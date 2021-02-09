% ====================================================
%> @brief Sets the output signal to a sinusoid
%>
%> @param obj Instance of class
%>
%> @param source Selected source
%>
%> @param freq Frequency 1µHz to 160MHz
%>
%> @param amp Amplitude into 50 Ohm in Vpp (boundaries depending on the frequency)
%>
%> @param offset DC Offset in V
%>
%> @param phase Start phase in DEG 0° to 360°
% =====================================================
function setSourceSinus(obj, source, freq, amp, offset, phase)
if source == 1 || source == 2
    
    if freq < 1E-6 || freq > 100E6
        error('Frequency out of bounds. Keep it between 1E-6 and 100E6');

    elseif freq > 1E-6 & freq <= 20E6
        if amp < 1E-3 || amp > 10
            error('Amplitude out of bounds. Keep it between 1E-3 and 10');
        end

    elseif freq > 1E-6 & freq <= 70E6
        if amp < 1E-3 || amp > 5
            error('Amplitude out of bounds. Keep it between 1E-3 and 5');
        end

    elseif freq > 1E-6 & freq <= 100E6
        if amp < 1E-3 || amp > 2.5
            error('Amplitude out of bounds. Keep it between 1E-3 and 2.5');
        end

    else
        if phase < 0 || phase > 360
            error('Phase out of bounds. Keep it between 0 and 360');
        end

        
    end
    write(obj,":SOUR"+source+":APPL:SIN "+freq+","+amp+","+offset+","+phase);
else
    error('Unknown input source. Source 1 or 2 are available');
end

end



