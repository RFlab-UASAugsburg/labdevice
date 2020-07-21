% ====================================================
%> @brief Defines the measurement type to be performed on the selected
%>        source
%>
%> @param obj Instance of class
%>
%> @param place selected measurement place
%>
%> @param MeasType Desired measurement type
%> Syntax: place: 1..8
%>         Measurement types: "FREQ" 
%>
%>  possible measurement types: 
%>  Operation            type string      Comment
%>  Frequency            FREQ                
%>  Period               PER                      
%>  Peak-to-peak value   PEAK               
%>  Max. upper value     UPE           
%>  Min. lower value     LPE
%>  Pos. pulse count     PPC
%>  Neg. pulse count     NPC 
%>  Rising edge count    REC
%>  Falling edge count   FEC
%>  High mean value      HIGH             of a square wave
%>  Low mean value       LOW              of a square wave
%>  Amplitude            AMPL             of a square wave
%>  Root mean square     RMS              for the complete waveform
%>  Rise time            RTIM             left-most rising edge
%>  Falling time         FTIM             left-most falling edge
%>  Pos. duty cycle      PDC
%>  Neg. duty cycle      NDC
%>  Width pos. pulses    PPW
%>  Width neg. pulses    NPW
%>  Mean voltage value   CYCM             left-most signal period used
%>  Cyclic RMS           CYCR             left-most signal period used
%>  Std. deviation       STDD
%>  Cyclic std. dev.     CYCS
%>  Edge delay           DEL              Time difference between two edges
%>  Phase                PHAS
%>  Burst width          BWID             first edge to last edge that
%>                                        crosses middle reference level
%>  Pos. overshoot       POV              of a square wave
%>  Neg. overshoot       NOV              of a square wave

% =====================================================

function defineQuickMeasurementType(obj, place, MeasType)
    possibleMeasurementTypes = {'FREQ','PER','PEAK','UPE','LPE','PPC','NPC','REC','FEC','HIGH','LOW',...
        'AMPL','RMS','RTIM','FTIM','PDC','NDC','PPW','NPW','CYCM','CYCR','STDD','CYCS','DEL','PHAS',...
        'BWID','POV','NOV'};
    if any(strcmpi(possibleMeasurementTypes,MeasType))
       if (place >= 1 && place <= 8)
         write(obj,"MEAS"+place+":MAIN "+MeasType);
       else
          error('Only measurement places 1..8 are selectable');
       end
    else
       error("Measurement type can only be" + string(join(possibleMeasurementTypes))); 
    end
end
    





