function setCenterFrequency(obj,freq,varargin)
%SETCENTERFREQUENCY set the center frequency and optionally span
% Parameters:
%	obj.prop:	labDevice Handle with properties
%            	- mode
%               - address
%               - port
%               - prop.comm(unication)Handle (interface specific)
%
%   freq:      center frequency either as double in Hz or as string with
%              unit
%   span:      span either as double in Hz or as string with
%              unit
% Return values:
%  
if ~isempty(varargin)
    span = varargin{1};
    obj.write("FREQ:CENT " + freq + ";SPAN " + span);
else
    obj.write("FREQ:CENT " + freq)
end
end

