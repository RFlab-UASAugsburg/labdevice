% ====================================================
%> @brief Start defined number of acquisitions
%>
%> @param obj Instance of class
%>
%> @param count Number of waveforms acquired
% =====================================================
function runSingleAcquisition(obj, count)

    write(obj,"*WAI; ACQ:NSIN:COUN "+count);
    write(obj,'*WAI; RUNS');
end

