% ====================================================
%> @brief Get the selected format for data export
%>
%> @param obj Instance of class
%>
%> @return Export data format 
% =====================================================

function ExportDataFormat = getExportDataFormat(obj)
    write(obj,"FORM?; *WAI");
    message = obj.read;
    message = strip(message);
    if isempty(message)
        error("no response from device");
    end

    ExportDataFormat = message;
    
 end