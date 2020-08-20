% ======================================================================
%> @brief Write SCPI/skippy commands to labdevice
%>
%> @param obj Instance of labDevice class
%> @param txt String with SCPI/skippy commands for labdevice
% ======================================================================
function write(obj, txt)
    writeDev(obj, txt);
end