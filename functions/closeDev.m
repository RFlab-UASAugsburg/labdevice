function obj=closeDev(obj)

switch(obj.prop.mode)
    case 'eth'
        obj=eth.close(obj);
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