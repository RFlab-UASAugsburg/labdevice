function setI(obj, current, varargin)
%SETVOLTAGE Summary of this function goes here
%   P6V:    6V rail
%   P25V:   25V rail
%   N25V:   -25V rail
if ~isempty(varargin)
    source = varargin{1};
    u = obj.getULimit(source);
    obj.write("APPL " + source +", "+u+", " + current);
else
    obj.write("CURR " + current);
end

