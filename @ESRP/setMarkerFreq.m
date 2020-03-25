% ====================================================
%> @brief set a marker to frequency and return Y-Value there
%>
%> optionally specify which marker to move (or add if it hasn't been used yet)
%>
%> @param obj Instance of class
%> @param freq frequency in Hz
%> @param varargin marker index [optional]
%>
%> @return Y measured Y value, the unit depends on current device settings (change using setPowUnit)
% =====================================================
function Y = setMarkerFreq(obj,freq,varargin)
	if ~isempty(varargin)
	        mark_num = varargin{1};
	    else
	        mark_num = 1;
	end
	obj.write("CALC:MARK" + mark_num + ":X " +freq);
	Y = obj.getMarkerY(mark_num);
end

