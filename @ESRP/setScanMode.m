function setScanMode(obj,mode)
%SETSCANMODE set the scan mode
%       also checks if the mode was set correctly. Only useful in receiver
%       mode!
% Parameters:
%	obj.prop:	labDevice Handle with properties
%            	- mode
%               - address
%               - port
%               - prop.comm(unication)Handle (interface specific)
%
%   mode:      "TDO" for time domain scans in the frequency domain
%              "SCAN" Selects the stepped scans in the frequency domain
%              "SWE" only possible mode during spectrum mode
% Return values:
    obj.write("FREQ:MODE "+mode);
    if ~strcmp(obj.getScanMode,mode)
        warning("could not set scan mode, current scan mode is" + obj.getScanMode);
    end
end

