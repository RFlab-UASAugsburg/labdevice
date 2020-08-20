% ====================================================
%> @brief return Y value of a specified marker
%>
%> @param obj Instance of class
%> @param varargin optionally specify which marker to use for measurement (defaults to 1)
%>
%> @return Y unit depends on the current device settings
% =====================================================


function Y = getMarkerY(obj,varargin)
    if ~isempty(varargin)
        mark_num = varargin{1};
    else
        mark_num = 1;
    end
    obj.write("CALC:MARK" + mark_num + ":Y?;*WAI");
    Y = obj.read;
    if ~isnan(str2double(Y))
        Y = str2double(Y);
    else
        if isempty(Y)
            error("no response from device, maybe no marker set yet?");
        else
            error("bad message from device");
        end
    end
end
