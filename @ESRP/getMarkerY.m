function Y = getMarkerY(obj,varargin)
%GETMARKERX return Y-Value of specified marker
%   if no number is specified, the first marker is chosen
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
