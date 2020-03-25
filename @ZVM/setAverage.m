% ======================================================================
%> @brief configure averaging
%>
%> currently only set up for point averaging, functionality could be extended
%>
%> @param obj Instance of ZVM class
%> @param average -1 for no averaging, otherwise the amount of measurements to average into a single result.
% ======================================================================
function setAverage(obj,average)
if average == -1
    obj.write('AVER OFF');
else
    obj.write('AVER:MODE POIN');%
    obj.write(['AVER:COUN ',num2str(average)]);
    obj.write('AVER ON');
end
