% ======================================================================
%> @brief Reads data from Device.
%>
%> Read function for interfaces, independent of which interface type is 
%> used. Reads the obj.mode property to decide which low level read 
%> function is used on the obj.commHandle.
%>
%> @param obj Instance of labDevice class
%> @return ret read data as a single character Array
% ======================================================================
function ret = readDev(obj)
    switch(obj.prop.mode)
        case 'eth'
            ret = customEthOverJava.read(obj);
        case 'gpib'
            ret = customGpib.read(obj);
        case 'eth2gpib'
            ret = customEth2Gpib.read(obj);
        case 'serial'
            error('openDev: Not implemented yet');
        case 'eth2serial' 
            error('openDev: Not implemented yet');
        otherwise
            error('openDev: Unknown mode');            
    end
return 