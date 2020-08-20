% ====================================================
%> @brief set a marker to the biggest peak
%> 
%> no measurement is returned.
%> optionally specify which marker to move (or add if it hasn't been used yet)
%> 
%> @param obj Instance of class
%> @param varargin optionally specify which marker to use for measurement (defaults to 1)
% =====================================================

function setMarkerPeak(obj,varargin)
	if ~isempty(varargin)
	        mark_num = varargin{1};
	    else
	        mark_num = 1;
	end
	obj.write("CALC:MARK" + mark_num + ":MAX:PEAK");
end

