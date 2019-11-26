function Y = setMarkerFreq(obj,freq,varargin)
%SETMARKERFREQ set a marker to frequency and return Y-Value there
%   freq: frequency to set a marker at
%   optionally specify which marker to move/add
if ~isempty(varargin)
        mark_num = varargin{1};
    else
        mark_num = 1;
end
obj.write("CALC:MARK" + mark_num + ":X " +freq);
Y = obj.getMarkerY(mark_num);
end

