% ====================================================
%> @brief get the measurement time for a time or frequency domain measurement
%> 
%> @param obj Instance of class
%> @param varargin leave empty to get frequency domain sweep time, or specify a scan range [1..10] for time domain scan time
%>
%> @return time in seconds
% =====================================================


function time = getMeasTime(obj,varargin)
    if isempty(varargin)
        obj.write("SWE:TIME?");
    else
        obj.write("SCAN"+varargin{1}+":TIME?");
    end
    time = str2double(obj.read);
end

