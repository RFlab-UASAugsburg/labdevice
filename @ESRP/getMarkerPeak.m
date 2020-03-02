function [X,Y] = getMarkerPeak(obj,varargin)
%GETPEAK return X and Y value of the biggest peak
%   optionally specify which marker to use for measurement
if ~isempty(varargin)
        mark_num = varargin{1};
    else
        mark_num = 1;
end
obj.setMarkerPeak(mark_num);
X = obj.getMarkerX(mark_num);
Y = obj.getMarkerY(mark_num);
end

