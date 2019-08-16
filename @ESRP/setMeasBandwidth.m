function setMeasBandwidth (obj, rbw, range)
%
% Measurement bandwidth (resolution bandwidth "RES BW") used within the scan range. (filter)
%   DEPENDING ON RANGE
%
% Resulution bandwidth calculation: BW ? f_input * 0.5
% If you use the Quasipeak, CISPR Average or RMS Average detector,
% the R&S ESRP by default couples the resolution bandwidth to the receiver frequency.
% If you need a different bandwidth, you can decouple the bandwidth from the frequency.
% When decoupled, you can select any of the supported CISPR bandwidth
% Detailed informations: ESRP_user_manual_en_08 p. 142
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
%   rbw:        resolution bandwidth [Hz]
%
%   range:      choose the range
%               1 - 10 [int]
%
% Return values:
%   /
%
% See also:
%

if (range < 0 || range > 10)
	error('range is not correct (0 to 10)');
else
    write(obj, ['SCAN', num2str(range), ':BAND:RES ', num2str(rbw), 'Hz; *WAI']);
end


end
