function setMarkerPeak(obj,varargin)
%SETMARKERPEAK set a marker to the biggest peak
%   optionally specify which marker to move/set
if ~isempty(varargin)
        mark_num = varargin{1};
    else
        mark_num = 1;
end
obj.write("CALC:MARK" + mark_num + ":MAX:PEAK");
end

