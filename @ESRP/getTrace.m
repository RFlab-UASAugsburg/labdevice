% ====================================================
%> @brief get data of a trace
%> 
%> request, read and parse trace
%> returns a double array of trace values
%>
%> @param obj Instance of class
%> @param freqPoints number of frequency points in the trace
%> @param varargin select the trace index, defaults to 1
%>
%> @return stepsize in Hz
% =====================================================

function trace = getTrace(obj, freqPoints, varargin)
    if ~isempty(varargin)
        trac_num = varargin{1};
    else
        trac_num = 1;
    end
    prev = obj.read; %empty buffer in case data was previously requested and not read
    obj.write("TRAC? TRACE" + trac_num + "; *WAI");
    pause(0.1);
    message = obj.read;
    i=0;
    %make sure we've read all the data available
    while length(sscanf(message,'%f,')) < freqPoints
        if i > 5
            error("not enough data from ESRP");
        end
        pause(0.1)
        message = [message obj.read];
        i = i+1;
    end
    %parse read data
    trace = sscanf(message,"%e,");
    %handle 
    if isempty(trace)
        disp(prev);
        disp(message);
        error("bad message from device");
    end
end
