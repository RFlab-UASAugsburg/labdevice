% ====================================================
%> @brief Get the selected format for data export
%>
%> @param obj Instance of class
%>
%> @return Export data format 
% =====================================================

function ExportDataFormat = getExportDataFormat(obj)
    write(obj,"*WAI; FORM?");
    message = obj.read;
    message = strip(message);
    if strlength(message) == 0
        error("no response from device");
    end

    ExportDataFormat = message;
    
 end