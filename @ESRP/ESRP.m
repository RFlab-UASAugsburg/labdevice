classdef  ESRP < labDevice
    properties
      % Add device specific properties here
    end
   methods 
       function obj = ESRP(mode, varargin)
           obj@labDevice(mode, varargin);
           % add device specific constructor from here on
           fclose(obj.prop.commHandle); % close connection in order to change connection parameters
           % using fclose and fopen here is a workaround.
           % Must be considered when using matlab without its communication
           % toolbox or when exporting the code to octave.
           set(obj.prop.commHandle,'InputBufferSize', 2^24)
           set(obj.prop.commHandle,'OutputBufferSize', 2^24)
           set(obj.prop.commHandle,'Timeout', 20);
           fopen(obj.prop.commHandle);
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