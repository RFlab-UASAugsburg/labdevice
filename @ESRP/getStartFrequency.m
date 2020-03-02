function freq = getStartFrequency(obj, range)
%
% Sets the start frequency.
%   DEPENDING ON RANGE
%
% (long description goes here)
%
%
% Parameters:
%	obj.prop:	labDevice Handle with properties
%            	- mode
%               - address
%               - port
%               - prop.comm(unication)Handle (interface specific)
%
%   range:      defines which start frequency will be returned
%               0:      gets the start frequency of the whole measurement
%               1-10:    gets the start frequency of the range 1 to 10
%
% Return values:
%   freq:       start frequency in Hz
%
% See also:
%
    if (range < 0 || range > 10)
        error('range is not correct (0 to 3)');
    else
        switch range
            case 0
                obj.write("FREQ:STAR?");

            otherwise
                obj.write("SCAN"+ num2str(range)+ ":STAR?");
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
% result = '000000';
% % Abfrage des Operation Complete Bit
% while str2num(result(6)) ~= 1
%     writeDev(obj, '*OPC?');
%     result = readDev(obj);
% end´
end