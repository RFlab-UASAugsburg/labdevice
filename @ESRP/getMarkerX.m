function X = getMarkerX(obj,varargin)
%GETMARKERX return X-Value of specified marker
%   if no number is specified, the first marker is chosen
    if ~isempty(varargin)
        mark_num = varargin{1};
    else
        mark_num = 1;
    end
    obj.write("CALC:MARK" + mark_num + ":X?;*WAI");
    X = obj.read;
    if ~isnan(str2double(X))
        X = str2double(X);
    else
        if isempty(X)
            error("no response from device, maybe no marker set yet?");
        else
            error("bad message from device");
        end
    end
end

