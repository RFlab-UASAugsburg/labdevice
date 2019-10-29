function power = getPowerZeroSpan(esrp, freq)
%
% This method returns the power at the specified frequency. Spectrum
% mode!
%   
%
%
% Parameters:
%   esrp.prop:       labDevice Handle with properties
%                - mode
%                - address
%                - port
%                - prop.comm(unication)Handle (interface specific)
%   freq:           center frequency in Hz (for example 5e8)        
% Return values:
%   power:          measured power in dBm
%
% See also:
%
esrp.write("FREQ:CENT " + string(freq) +" HZ;SPAN 0HZ");
esrp.write("BAND:RES 300 kHz");
esrp.write("SWE:TIME 200US");
esrp.write("CALC:MARK:FUNC:SUMM:RMS ON");
esrp.write("CALC:MARK:FUNC:SUMM:RMS:RES?");
power = esrp.read;
end

