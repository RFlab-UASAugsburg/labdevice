classdef  SMX < labDevice
    properties
      % Add device specific properties here
    end
   methods 
       function obj = SMX(mode, varargin)
           obj@labDevice(mode, varargin);
           % add device specific constructor from here on
       end
       
       function delete(obj)
           delete@labDevice(obj);
           % add device specific destructor from here on
       end
       
       % All functions that are inheritanced methods of the superclass
       % labDevice need to be initalised here once more.
       
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
       
   end
 
end