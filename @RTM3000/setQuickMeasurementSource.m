% ====================================================
%> @brief Set quick measurement source(s)
%>
%> @param obj Instance of class
%>
%> @param place Selected measurement place
%>
%> @param SignalSourceOne Active first source channel
%> 
%> @param varargin Active second source channel if nessessary (e.g. phase)
%> 
% =====================================================

function setQuickMeasurementSource(obj, place, SignalSourceOne, varargin)
    possibleSources = {'CH1','CH2','CH3','CH4','MA1','RE1','RE2','RE3','RE4'};
    if any(strcmp(possibleSources,SignalSourceOne))
        if any(strcmp(possibleSources,varargin{1}))
            switch nargin
                case 4
                    write(obj,"MEAS"+place+":SOUR "+SignalSourceOne+","+varargin{1});
                case 3
                    write(obj,"MEAS"+place+":SOUR "+SignalSourceOne);
                otherwise
                    error("Too many input arguments");
            end
        else
            error("measurement source can only be" + string(join(possibleSources)));
        end

    else
        error("measurement source can only be" + string(join(possibleSources)));
    end
end






