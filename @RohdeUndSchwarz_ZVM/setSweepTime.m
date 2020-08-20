% ======================================================================
%> @brief configure the sweep time (in ms)
%>
%> @param obj Instance of RohdeUndSchwarz_ZVM class
%> @param time -1 for automatic sweep time, otherwise time in ms
% ======================================================================
function setSweepTime(obj,time)
%SETSWEEPTIME Summary of this function goes here
%   Detailed explanation goes here
    if time~=-1% Manuelle einstellung der Sweeptime
        obj.write("SWE:TIME " + time + "ms");
    else
        obj.write("SWE:TIME:AUTO ON");
    end
end
