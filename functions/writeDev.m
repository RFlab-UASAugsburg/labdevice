function ret=writeDev(obj,txt)

switch(obj.prop.mode)
    case 'eth'
        ret=eth.write(obj,txt);
    case 'gpib'
        gpib.open(obj)
    case 'eth2gpib'
        error('openDev:Not implemented yet');
    case 'serial'
        error('openDev:Not implemented yet');
    case 'eth2serial' 
        error('openDev:Not implemented yet');
    otherwise
        error('openDev:Unknown mode');            
end

return 