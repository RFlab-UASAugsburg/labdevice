% ====================================================
%> @brief get data of a trace
%> 
%> request, read and parse trace
%> returns a double array of trace values
%>
%> @param obj Instance of class
%> @param varargin select the trace index, defaults to 1
%>
%> @return stepsize in Hz
% =====================================================

function trace = getTrace(obj, varargin)
    if ~isempty(varargin)
        trac_num = varargin{1};
    else
        trac_num = 1;
    end
    prev = obj.read; %empty buffer in case data was previously requested and not read
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
