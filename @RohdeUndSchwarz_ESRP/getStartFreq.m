% ====================================================
%> @brief get the start frequency
%> 
%> get the start frequency of the whole measurement, or of a specified scan range
%> (in spectrum mode, no scan ranges are available)
%>
%> @param obj Instance of class
%> @param varargin leave empty to get the start frequency of the whole measurement, [1..10] for a scan range
%>
%> @return freq in Hz
% =====================================================

function freq=getStartFreq(obj, varargin)
    if ~isempty(varargin)
        if (varargin{1} < 1 || varargin{1} > 10)
            error('range is not correct (1 to 10)');
        else
            write(obj, ['SCAN', num2str(varargin{1}), ':STAR?']);
        end
    else
        write(obj, ['FREQ:STAR?']);
    end
    freq = obj.read;
    if isnan(str2double(freq))
        if isempty(freq)
            error("no message returned from device");
        else
            error("bad message returned from device");
        end
    else
        freq = str2double(freq);
    end
end