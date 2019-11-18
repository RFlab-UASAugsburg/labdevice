classdef ProLogix < labDevice
    %PROLOGIX Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
    end
    
    methods
        function obj = ProLogix(address,port)
            obj@labDevice(mfilename, "eth",address,port);
            obj.prop.currentGPIBAddress = 0;
        end
        
        function delete(obj)
           delete@labDevice(obj);
           % add device specific destructor from here on
        end
        
        function ret = read(obj)
            ret = read@labDevice(obj);
        end
        
        function flush(obj)
           flush@labDevice(obj);
           % add device flush destructor from here on
        end
        
        function write(obj, txt)
            write@labDevice(obj,txt);
        end
        
        setGPIBAddress(obj,address);
    end
end

