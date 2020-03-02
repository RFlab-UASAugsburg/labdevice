function trace = getTrace(obj, varargin)
%GETTRACE returns double array of trace values
%   request, read and parse trace
    if ~isempty(varargin)
        trac_num = varargin{1};
    else
        trac_num = 1;
    end
    prev = obj.read;
    obj.write("TRAC? TRACE" + trac_num + "; *WAI");
    message = obj.read;
    trace = sscanf(message,"%e,");
    if isempty(trace)
        if isempty(message)
            error("no answer from device");
        else
            disp(prev);
            disp(message);
            error("bad message from device");
        end
    end
end
