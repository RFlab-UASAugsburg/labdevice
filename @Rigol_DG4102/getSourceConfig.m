% ====================================================
%> @brief Get current configuration of the generator
%>
%> @param obj Instance of class
%>
%> @param source Selected source 1 or 2
%>
%> @output SourceConfig 2x5 cell array containing the current output
%>        configurations
% =====================================================
function SourceConfig = getSourceConfig(obj, source)
    switch source
        case 1
            write(obj,':SOUR1:APPL?');
        case 2
            write(obj,':SOUR2:APPL?');
        otherwise
            error('Source not found. Possible sources 1 or 2');
    end
    message = obj.read; 
    if isempty(message)
            error("no response from device");
    end
    SourceConfig = [{'Waveform Name','Frequency','Amplitude','Offset','Start Phase/Delay'};strsplit(message,',')];
    

end
