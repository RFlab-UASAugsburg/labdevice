classdef ProLogix < labDevice
    %PROLOGIX GPIB-Ethernet adapter. 
    %   Create an object of this class and then use it when constructing a
    %   labdevice with mode eth2gpib. Don't directly write or read from a
    %   Prologix device, other than for debugging purposes.
    
    properties
    end
    
    methods
        function obj = ProLogix(varargin)
            mode = varargin{1};
            varargin(1) = [];
            obj@labDevice(mfilename,mode,varargin);
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

