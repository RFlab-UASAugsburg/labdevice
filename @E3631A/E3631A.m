classdef E3631A < labDevice
    %E3631A Triple Output Power Supply
    %   Implement lab device controls for the PSU
    
    properties
        
    end
    
    methods
        function obj = E3631A(mode, varargin)
            obj@labDevice(mfilename,mode, varargin);
        end
        
        function delete(obj)
           
           delete@labDevice(obj);
        end
       
        function ret = read(obj)
            ret = read@labDevice(obj);
        end

        function flush(obj)
            flush@labDevice(obj);
        end

        function write(obj, txt)
            write@labDevice(obj, txt);
        end
    end
end

