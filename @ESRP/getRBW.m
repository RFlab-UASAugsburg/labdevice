function rbw = getRBW(obj,varargin)
%GETRBW get rbw of either a specific scan range, or the main rbw
%currently set.
%   provide a index between 1 and 10 to get the rbw of the corresponding
%   range
% Parameters:
%	obj.prop:	labDevice Handle with properties
%            	- mode
%               - address
%               - port
%               - prop.comm(unication)Handle (interface specific)
%
%   varargin:   number between 1 and 10 to choose scan range
    if isempty(varargin)
        obj.write("BAND:RES?");
    else
        obj.write("SCAN"+varargin{1}+":BAND:RES?");
    end
    rbw = str2double(obj.read);
end

