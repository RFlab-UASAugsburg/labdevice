% ======================================================================
%> @brief set the sweep count
%>
%> idk what this does, need to do some research in the manual later
%>
%> @param obj Instance of RohdeUndSchwarz_ZVM class
%> @param count sweep count
% ======================================================================
function setSweepCount(obj,count)
%SETSWEEPCOUNT Summary of this function goes here
%   Detailed explanation goes here
obj.write("SWE:COUNT " + count);
end

