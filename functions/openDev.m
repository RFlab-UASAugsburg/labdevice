% ======================================================================
%> @brief Opens connection to Device.
%>
%> Open function for interfaces, independent of which interface type is 
%> used. Reads the obj.mode property to decide which low level open 
%> function is used to fill the obj.commHandle. 
%>
%> @param obj Instance of labDevice class
%> @return obj Instance of labDevice class
% ======================================================================
function obj = openDev(obj)
    switch(obj.prop.mode)
        case 'eth'
            obj = customEthOverJava.open(obj);
        case 'gpib'
            obj = customGpib.open(obj);
        case 'eth2gpib'
            %nothing to do;
        case 'serial'
            error('openDev: Not implemented yet');
        case 'eth2serial' 
            error('openDev: Not implemented yet');
        otherwise
            error('openDev: Unknown mode');            
    end
end