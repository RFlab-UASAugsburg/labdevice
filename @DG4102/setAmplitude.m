% ====================================================
%> @brief Sets the amplitude of the basic waveform
%>
%> @param obj Instance of class
%>
%> @param output Selected output
%>
%> @param amplitude Desired amplitude in [Vpp]
%> Note: Amplitude range is limited by the impedance and freq./period
%> ?20MHz:  1mVpp to 10Vpp 
%> ?70MHz:  1mVpp to 5Vpp 
%> ?100MHz: 1mVpp to 2.5Vpp
%>
% =====================================================

function setAmplitude(obj,output,amplitude)
if (output == 1 || output == 2)
    write(obj,":SOUR"+output+":VOLT "+amplitude);
else
    error('Unknown output. Available outputs: 1 or 2');
end
    
end