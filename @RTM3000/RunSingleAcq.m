% ====================================================
%> @brief Start defined number of acquisitions
%>
%> @param obj Instance of class
%> @param count Number of waveforms acquired
% =====================================================
function RunSingleAcq(obj, count)

    write(obj,["ACQ:NSIN:COUN " + count]);
    write(obj,'RUNS');
end

