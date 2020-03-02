function freq = getSpan(obj)
%GETCENTERFREQUENCY get frequency span of ESRP
% Parameters:
%	obj.prop:	labDevice Handle with properties
%            	- mode
%               - address
%               - port
%               - prop.comm(unication)Handle (interface specific)
%
% Return values:
%   freq:       span in Hz

    obj.write("FREQ:SPAN?");
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

