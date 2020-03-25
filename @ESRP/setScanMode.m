% ====================================================
%> @brief set the scan mode.
%>
%> Also checks if the mode was set correctly. Only useful in receiver mode!
%>
%> @param obj Instance of class
%> @param mode 'SCAN' || 'TDOM' || 'SWE'
% =====================================================

function setScanMode(obj,mode)
    obj.write("FREQ:MODE " + mode);
    if ~strcmp(obj.getScanMode,mode)
        warning("could not set scan mode, current scan mode is" + obj.getScanMode);
    end
end

