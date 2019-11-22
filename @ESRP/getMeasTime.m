function time = getMeasTime(obj,varargin)
%GETSTEPSIZE get stepsize of either a specific scan range, or the main rbw
%currently set.
%   provide a index between 1 and 10 to get the stepsize of the corresponding
%   range
% Parameters:
%	obj.prop:	labDevice Handle with properties
%            	- mode
%               - address
%               - port
%               - prop.comm(unication)Handle (interface specific)
%
%   varargin:   number between 1 and 10 to choose scan range [optional]
    if isempty(varargin)
        obj.write("SWE:TIME?");
    else
        obj.write("SCAN"+varargin{1}+"TIME?");
    end
    time = str2double(obj.read);
end

