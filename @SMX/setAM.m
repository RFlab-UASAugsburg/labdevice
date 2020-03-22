% ====================================================
%> @brief Set Amplitude Modulation Parameters
%>
%> @param obj Instance of class
%> @param mode 'INT': use internal modulation;
%>             'EXT': use external modulation;
%>             'OFF': disable AM modulation
%>
%> If internal modulation is used:
%> @param amplitudeFreq Amplitude Frequency [Hz]
%> @param modulationStrength Modulation Strength [%]
% =====================================================
function setAM(obj,mode,varargin)
switch upper(mode)
    case 'INT'
        amplitudeFreq = varargin{1};
        modulationStrength = varargin{2};
        obj.write("AF " + amplitudeFreq + "HZ");
        obj.write("AF:ON");
        obj.write("AM:I");
        obj.write("AM " + modulationStrength + "%");
    case 'EXT'
        obj.write("AM:E");
        obj.write("AF:OFF");
    case 'OFF'
        obj.write("AM:OFF");
end
end
