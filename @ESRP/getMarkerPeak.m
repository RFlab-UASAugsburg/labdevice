% ====================================================
%> @brief return X and Y value of the biggest peak
%>
%> @param obj Instance of class
%> @param varargin optionally specify which marker to use for measurement (defaults to 1)
%>
%> @return [X,Y] X in Hz. The Y unit depends on the current settings of the device.
% =====================================================

function [X,Y] = getMarkerPeak(obj,varargin)
	if ~isempty(varargin)
	        mark_num = varargin{1};
	    else
	        mark_num = 1;
	end
	obj.setMarkerPeak(mark_num);
	X = obj.getMarkerX(mark_num);
	Y = obj.getMarkerY(mark_num);
end

