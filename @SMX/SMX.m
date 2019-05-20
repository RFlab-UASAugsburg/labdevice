classdef  SMX < labDevice
    properties
      % Add device specific properties here
    end
   methods 
       function obj=SMX(mode,varargin)
            obj@labDevice(mode,varargin);
           % add device specific constructor from here on
       end
       
       function delete(obj)
            delete@labDevice(obj);
           % add device specific destructor from here on
       end
       
   end
 
end