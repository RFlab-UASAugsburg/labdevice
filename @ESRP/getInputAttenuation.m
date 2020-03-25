% ====================================================
%> @brief get current input attenuation value, the auto ATT status, or the input protection status
%>
%> @param obj Instance of class
%> @param varargin 'prot' for protection status, 'auto' for auto ATT status, leave empty to get attenuation value
%>
%> @return att input attenuation in dB, or 'on'/'off' for status queries
% =====================================================

function att = getInputAttenuation(obj,varargin)
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

