% ====================================================
%> @brief set the resolution bandwidth
%> 
%> set the resolution bandwidth of the whole measurement, or of a specified scan range
%> (in spectrum mode, no scan ranges are available)
%> Resulution bandwidth calculation: BW ? f_input * 0.5
%> If you use the Quasipeak, CISPR Average or RMS Average detector,
%> the R&S ESRP by default couples the resolution bandwidth to the receiver frequency.
%> If you need a different bandwidth, you can decouple the bandwidth from the frequency.
%> When decoupled, you can select any of the supported CISPR bandwidths
%> Detailed informations: ESRP_user_manual_en_08 p. 142
%>
%> @param obj Instance of class
%> @param rbw resolution bandwidth in Hz
%> @param varargin leave empty to set the start frequency of the whole measurement, [1..10] for a scan range
%>
%> @return rbw in Hz
% =====================================================

function setMeasBandwidth (obj, rbw, varargin)
    if isempty(varargin)
        obj.write("BAND:RES " + rbw + "Hz; *WAI");
    else
    	if (varargin{1} < 1 || varargin{1} > 10)
    		error('Range is not correct (0 to 10)');
    	else
        	obj.write("SCAN"+varargin{1}+":BAND:RES " + rbw + "Hz; *WAI");
        end
    end
end
