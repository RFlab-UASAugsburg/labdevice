% ====================================================
%> @brief Sets the input attenuation.
%>   'prot' and 'auto' needs to be set.
%>   'value' only when automatic attenuation configuration is turned off.
%>
%> WARNING: To protect the input mixer, the attenuation levels of 10dB or
%> less are possible only if the input protection ('prot') is turned off.
%>
%> @param obj Instance of class
%> @param prot [string] 'on' || 'off'
%> @param auto [string] 'on' || 'off'
%> @param value attenuation value in dB, int [0..70] with increments of 10
% =====================================================

function setInputAttenuation(obj, prot, auto, value)
    switch prot             % turns the input attenuation mode on or off
        case 'on'
            write(obj, ['INP:ATT:PROT ON']);
        case 'off'
            write(obj, ['INP:ATT:PROT OFF']);
        otherwise
            error('Selected mode does not exist. (prot)');
    end

    switch auto             % turns the automatic attenuation configuration on or off
        case 'on'
            write(obj, ['INP:ATT:AUTO ON; *WAI']);
        case 'off'
            write(obj, ['INP:ATT:AUTO OFF; *WAI']);
            write(obj, ['INP:ATT ', num2str(value), 'dB']); % sets the attenuation value
        otherwise
            error('Selected mode does not exist. (auto)');
    end
end