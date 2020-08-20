% ====================================================
%> @brief get the resolution bandwidth
%> 
%> get the resolution bandwidth of the whole measurement, or of a specified scan range
%> (in spectrum mode, no scan ranges are available)
%>
%> @param obj Instance of class
%> @param varargin leave empty to get the start frequency of the whole measurement, [1..10] for a scan range
%>
%> @return rbw in Hz
% =====================================================

function rbw = getMeasBandwidth(obj,varargin)
    if isempty(varargin)
        obj.write("BAND:RES?");
    else
        obj.write("SCAN"+varargin{1}+":BAND:RES?");
    end
    rbw = str2double(obj.read);
end

