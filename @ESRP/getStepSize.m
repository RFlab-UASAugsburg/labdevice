% ====================================================
%> @brief get the start frequency
%> 
%> get stepsize of either a specific scan range, or the main rbw
%> currently set
%>
%> @param obj Instance of class
%> @param varargin leave empty to get the main rbw, or specify a scan range [1..10] for stepsizes (always leave empty in spectrum mode)
%>
%> @return stepsize in Hz
% =====================================================
function stepsize = getStepSize(obj,varargin)
    if isempty(varargin)
        obj.write("FREQ:CENTER:STEP?");
    else
        obj.write("SCAN"+varargin{1}+":STEP?");
    end
    stepsize = str2double(obj.read);
end

