classdef RadiSense < labDevice
    %RADISENSE RadiSense Electric field probe
    %   Detailed explanation goes here
    
    properties
    end
    
    methods
        function obj = RadiSense(mode,varargin)
            obj@labDevice(mfilename,mode,varargin);
        end
        
        function delete(obj)
           delete@labDevice(obj);
           % add device specific destructor from here on
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
           % add device flush destructor from here on
        end
       
        function write(obj, txt)
           write@labDevice(obj, txt);
           % add device write destructor from here on
        end
    end
end

