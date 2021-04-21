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
switch nargin
    case 4
        if any(strcmp(possibleSources,SignalSourceOne))
            if any(strcmp(possibleSources,varargin{1}))
                write(obj,"*WAI; MEAS"+place+":SOUR "+SignalSourceOne+","+varargin{1});
            else
                error("Second source argument wrong -> measurement source can only be" + string(join(possibleSources)));
            end
            
        else
            error("First source argument wrong -> measurement source can only be" + string(join(possibleSources)));
        end
    case 3
        if any(strcmp(possibleSources,SignalSourceOne))
            write(obj,"*WAI; MEAS"+place+":SOUR "+SignalSourceOne);
        else
            error("measurement source can only be" + string(join(possibleSources)));
        end
    otherwise
        error("Too many input arguments");
end
  
end





