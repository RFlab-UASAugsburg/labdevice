% ======================================================================
%> @brief Close connection to Device.
%>
%> Close function for interfaces, independent of which interface type is 
%> used. Reads the obj.mode property to decide which low level close 
%> function is used on the obj.commHandle. 
%>
%> @param obj Instance of labDevice class
%> @return obj Instance of labDevice class
% ======================================================================
function obj = closeDev(obj)
    switch(obj.prop.mode)
        case 'eth'
            obj = customEthOverJava.close(obj);
        case 'gpib'
            obj = customGpib.close(obj);
        case 'eth2gpib'
            %nothing to do;
        case 'serial'
            error('openDev: Not implemented yet');
        case 'eth2serial' 
            error('openDev: Not implemented yet');
        otherwise
            error('openDev: Unknown mode');
    end
return