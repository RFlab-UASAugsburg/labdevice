% ====================================================
%> @brief Define format for data export
%>
%> @param obj Instance of class
%>
%> @param dataformat Desired dataformat for the data export (ASC,REAL,UINT)
%>
%> @param varargin accuracy which can only be set with UNIT (to 8,16,32)
% =====================================================

function setExportDataFormat(obj, dataformat, varargin)
dataformat = upper(dataformat);
dataformats = {'ASC','REAL','UINT'};
    if any(strcmp(dataformat,dataformats))
            switch nargin
                case 2
                    switch dataformat
                        case 'ASC'
                            write(obj,"*WAI; FORM "+dataformat);
                        case 'REAL'
                            write(obj,"*WAI; FORM "+dataformat);
                    end

                case 3
                    if varargin{1} == 8 || varargin{1} == 16 || varargin{1} == 32
                        write(obj,"*WAI; FORM "+dataformat+","+varargin{1});
                    else
                        error("accuracy can only be set to 8,16,32");
                    end

                otherwise
                    error("too many argument inputs");
            end

    else
        error("dataformat can only be" + string(join(dataformats)));
    end
 end