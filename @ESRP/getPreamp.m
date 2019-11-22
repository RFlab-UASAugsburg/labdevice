function status = getPreamp(obj,varargin)
%GETPREAMP get the Preamp status
%   either provide a range to get the preamp status of a single scan
%   range, or nothing to get the main input preamp status.
    if isempty(varargin)
        obj.write("INP:GAIN:STAT?");
    else
        obj.write("SCAN"+varargin{1}+ ":INP:GAIN:STAT?");
    end
    status = strip(esrp.read);
end

