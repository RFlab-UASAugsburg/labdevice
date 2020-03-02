function setU(obj, voltage, varargin)
%SETVOLTAGE Summary of this function goes here
%   P6V:    6V rail
%   P25V:   25V rail
%   N25V:   -25V rail
if ~isempty(varargin)
    source = varargin{1};
    obj.write("APPL " + source +", "+voltage);
else
    obj.write("VOLT " + voltage);
end

