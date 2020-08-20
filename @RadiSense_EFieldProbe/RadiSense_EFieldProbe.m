%> @file RadiSense_EFieldProbe
%> @brief RadiSense Electrical Field Probe
% ======================================================
%> @brief RadiSense Electrical Field Probe, code is compatible with RadiSense 4, 6 and 18.
%>
%> Usage:
%
%> Initalise subclass
%> @code
%> radisense = RadiSense_EFieldProbe("gpib",... % mode
%>              6); % GPIB address
%> radisense.zero(); % zero the probe, this takes 15 seconds!
%> field = radisense.getField();
%> @endcode
% ======================================================
classdef RadiSense_EFieldProbe < labDevice
  
    properties
    end
    
    methods
        function obj = RadiSense_EFieldProbe(mode,varargin)
            obj@labDevice(mfilename,mode,varargin);
        end
        
        function delete(obj)
           delete@labDevice(obj);
        end
        function ret = read(obj)
           ret = read@labDevice(obj);
           % Handle error messages here
           switch strip(ret)
               case ":E1"
                   msgID = "RADISENSE:BadCommand";
                   msg = "Internal buffer overflow (too long command)";
               case ":E2"
                   msgID = "RADISENSE:BadCommand";
                   msg = "Command too long";
               case ":E3"
                   msgID = "RADISENSE:badCommand";
                   msg = "Invalid Command";
               case ":E4"
                   msgID = "RADISENSE:BadCommand";
                   msg = "Command too short, illegal character or invalid parameter";
               case ":E5"
                   msgID = "RADISENSE:HWError";
                   msg = "Hardware Error";
               case ":E6"
                   msgID = "RADISENSE:ParityError";
                   msg = "Parity Error";
               case ":E9"
                   msgID = "RADISENSE:NoConnection";
                   msg = "Probe is not connected, maybe LASER is off?";
               otherwise
                   return
           end
           throw(MException(msgID,msg));
                
        end
       
        function flush(obj)
           flush@labDevice(obj);
        end
       
        function write(obj, txt)
           write@labDevice(obj, txt);
        end
    end
end

