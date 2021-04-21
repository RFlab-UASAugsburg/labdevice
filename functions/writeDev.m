% ======================================================================
%> @brief Writes string to Device.
%>
%> Write function for interfaces, independent of which interface type is 
%> used. Reads the obj.mode property to decide which low level write 
%> function is used on the obj.commHandle. 
%>
%> @param obj Instance of labDevice class
%> @return ret exit code of write function, ususally 0 on success
% ======================================================================
function ret = writeDev(obj, txt)
    switch(obj.prop.mode)
        case 'eth'
            ret = customEthOverJava.write(obj,txt);
        case 'gpib'
            ret = customGpib.write(obj,txt);
        case 'eth2gpib'
            ret = customEth2Gpib.write(obj,txt);
        case 'serial'
            error('openDev: Not implemented yet');
        case 'eth2serial' 
            error('openDev: Not implemented yet');
        otherwise
            error('openDev: Unknown mode');            
    end
return