% ====================================================
%> @brief get the Preamp status
%>
%> get either the global preamp status or the status for a single scan range
%>
%> @param obj Instance of class
%> @param varargin leave empty to get global preamp status, or specify a scan range [1..10]
%>
%> @return status 1:on 0:off
% =====================================================

function status = getPreamp(obj,varargin)
    if isempty(varargin)
        obj.write("INP:GAIN:STAT?");
    else
        obj.write("SCAN"+varargin{1}+ ":INP:GAIN:STAT?");
    end
    status = str2double(obj.read);
end

