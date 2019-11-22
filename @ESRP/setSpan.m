function setSpan(obj,span)
%SETSPAN set the span
% Parameters:
%	obj.prop:	labDevice Handle with properties
%            	- mode
%               - address
%               - port
%               - prop.comm(unication)Handle (interface specific)
%
%   span:      span either as double in Hz or as string with
%              unit
% Return values:
%  
    obj.write("FREQ:SPAN " + span);
end

