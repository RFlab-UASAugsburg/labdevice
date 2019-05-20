classdef  SMX
    %%
   
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
                   if length(varargin)== 2
                       obj.prop.gpib.primaryAdress=varargin{1};
                       obj.prop.gpib.boardIndex=varargin{2};
                       obj.prop.gpib.vendor = 'ni'; % All lab devices up to now work with the National Instrument interface
                   elseif length(varargin)== 3
                       obj.prop.gpib.vendor=varargin{3};
                   else
                       error('SMX gpib: Wrong input arguments')
                   end

               otherwise
                   error('SMX: mode not supported')
           end
           obj=openDev(obj);
       end
       
       function delete(obj)
           closeDev(obj);
       end
   end
 
end