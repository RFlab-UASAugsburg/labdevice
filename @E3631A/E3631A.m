%> @file E3631A.m
%> @brief Keysight E3631A 80W Triple Output Power Supply
% ======================================================
%> @brief Keysight E3631A Power Supply 
%>
%> Usage:
%
%> Initalise subclass
%> @code
%> psu = E3631A("gpib",... % mode
%>              6); % GPIB address
%> psu.setVoltage(3,'P6V');
%> psu.setCurrent(1,'P6V');
%> psu.setOutput('N25V');
%> psu.setCurrent(0.05);
%> i = psu.getCurrentMeasured('P6V')
%> @endcode
% ======================================================

classdef E3631A < labDevice
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

