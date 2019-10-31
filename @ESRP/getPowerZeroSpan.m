function power = getPowerZeroSpan(obj, freq)
%
% This method returns the power at the specified frequency. Spectrum
% mode!
%   
%
%
% Parameters:
%   obj.prop:     labDevice Handle with properties
%                - mode
%                - address
%                - port
%                - prop.comm(unication)Handle (interface specific)
%
%   freq:           center frequency in Hz (for example 5e8)        
%
% Return values:
%   power:          measured power in dBm
%
% See also:
%


obj.write('FREQ:CENT ', string(freq), ' HZ;SPAN 0HZ');
obj.write('BAND:RES 300 kHz');
obj.write('SWE:TIME 200US');
obj.write('CALC:MARK:FUNC:SUMM:RMS ON');
obj.write('CALC:MARK:FUNC:SUMM:RMS:RES?');
power = obj.read;


end

