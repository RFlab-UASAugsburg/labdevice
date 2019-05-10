classdef  SMX
    properties
      prop
    end
   methods
       function obj=SMX(mode,varargin)
           obj.prop.mode=mode;
           switch (obj.prop.mode)
               case 'eth'
                   if length(varargin)~=2
                       error('SMX: eth wrong input arguments')
                   end
                   obj.prop.adress=varargin{1};
                   obj.prop.port=varargin{2};
               case 'gpib'
                   if length(varargin)~=1
                       error('SMX: gpib wrong input arguments')
                   end
                   obj.prop.adress=varargin{1};
               otherwise
                   error('SMX: mode not supported')
           end
           obj=openDev(obj);
       end
       
       function delete(obj)
           disp('DebugDeccstuktor')
           closeDev(obj);
       end
   end
 
end