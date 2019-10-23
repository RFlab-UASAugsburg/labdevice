classdef RadiSense < labDevice
    %RADISENSE Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        range
    end
    
    methods
        function obj = RadiSense(mode,varargin)
            obj@labDevice(mode,varargin);
        end
        
        function delete(obj)
           delete@labDevice(obj);
           % add device specific destructor from here on
        end
        function ret = read(obj)
           ret = read@labDevice(obj);
           % add device specific read from here on
        end
       
        function flush(obj)
           flush@labDevice(obj);
           % add device flush destructor from here on
        end
       
        function write(obj, txt)
           write@labDevice(obj, txt);
           % add device write destructor from here on
        end
        init(obj);
    end
end

