function att = getInputAttenuation(obj,varargin)
%GETINPUTATTENUATION get current input attenuation value, the auto ATT
%status, or the input protection status
%   
% provide no extra variables to get the input attenuation value. Add 'prot'
% or 'auto' to get the corresponding status.
% Parameters:
%	obj.prop:	labDevice Handle with properties
%            	- mode
%               - address
%               - port
%               - prop.comm(unication)Handle (interface specific)
%
%   varargin:   'prot' for protection status
%               'auto' for auto ATT status
    if isempty(varargin)
        obj.write("INP:ATT?");
        att = str2double(obj.read);
    else
        if strcmpi(varargin{1},'prot')
            obj.write("INP:ATT:PROT?");
        elseif strcmpi(varargin{1},'auto')
            obj.write("INP:ATT:AUTO?");
        end
        att = str2double(obj.read);
        if att ==0 
            att='off'; 
        else
            att='on';
        end
    end
end

