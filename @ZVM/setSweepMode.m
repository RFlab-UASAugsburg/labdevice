% ======================================================================
%> @brief choose single or continuous sweep mode
%>
%> use ZVM.continuousSweep and ZVM.singleSweep for readability
%>
%> @param obj Instance of ZVM class
%> @param mode 'cont' or 'single'
% ======================================================================
function setSweepMode(obj,mode)
    switch mode
        case 'cont'
            obj.write('INIT:CONT ON');
        case 'single'
            obj.write('INIT:CONT OFF');
        otherwise
            error("incorrect mode");
    end
end
