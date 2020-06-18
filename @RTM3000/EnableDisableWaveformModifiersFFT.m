% ====================================================
%> @brief Turn ON or OFF FFT waveform modifiers
%>
%> @param obj Instance of class
%> @param state ON or OFF to enable or disable certain waveform
%> @param waveform selected waveform to enable or disable 
%>        possible parameters: Spectrum['SPEC']
%>                             Average['AVER']
%>                             Maximum['MAX']
%>                             Minimum['MIN']
% =====================================================

function EnableDisableWaveformModifiersFFT(obj, waveform, state)
    state = upper(state);
    waveform = upper(waveform);
    states = {'ON','OFF'};
    waveforms = {'AVER','MAX','MIN','SPEC'};
    if any(strcmp(states,state))
        if any(strcmp(waveforms,waveform))
            switch waveform
                case 'AVER'
                    if strcmp(state,'ON')
                        write(obj,"SPEC:WAVE:AVER:ENAB ON");
                    else
                        write(obj,"SPEC:WAVE:AVER:ENAB OFF");
                    end
                case 'MAX'
                    if strcmp(state,'ON')
                        write(obj,"SPEC:WAVE:MAX:ENAB ON");
                    else
                        write(obj,"SPEC:WAVE:MAX:ENAB OFF");
                    end
                case 'MIN'
                    if strcmp(state,'ON')
                        write(obj,"SPEC:WAVE:MIN:ENAB ON");
                    else
                        write(obj,"SPEC:WAVE:MIN:ENAB OFF");
                    end
                case 'SPEC'
                    if strcmp(state,'ON')
                        write(obj,"SPEC:WAVE:SPEC:ENAB ON");
                    else
                        write(obj,"SPEC:WAVE:SPEC:ENAB OFF");
                    end
            
            end
            
        else
            error("waveforms can only be" + string(join(types)));
        end
        
    else
        error("States can only be" + string(join(states)));
    end
    
end

