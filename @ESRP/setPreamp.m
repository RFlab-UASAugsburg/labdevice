% ====================================================
%> @brief get the Preamp status
%>
%> Configure the preamplifier for either the main screen or receiver scan
%> ranges.
%>
%> @param obj Instance of class
%> @param stat 'on' or 'off'
%> @param varargin leave empty to set global preamp status, or specify a scan range [1..10]
% =====================================================

function setPreamp (obj, stat, varargin)
    if isempty(varargin)
        switch lower(stat)
            case 'on'
                write(obj, "INP:GAIN:STAT ON; *WAI");
            case 'off'
                write(obj, "INP:GAIN:STAT OFF; *WAI");

            otherwise
                error('Parameter not readable. Check the datatype. (stat)');
        end
    else
        if varargin{1} <1 || varargin {1} > 10
            error('range is not correct (1 to 10)');
        else
            switch lower(varargin{1})
                case 'on'
                    write(obj, "SCAN" + num2str(varargin{1}) + ":INP:GAIN:STAT ON;*WAI");
                case 'off'
                    write(obj, "SCAN" + num2str(varargin{1}) + ":INP:GAIN:STAT OFF;*WAI");
                otherwise
                    error('Parameter not readable. Check the datatype. (stat)');
            end
        end
    end
end