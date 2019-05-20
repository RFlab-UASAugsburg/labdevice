classdef  labDevice
    properties
      prop
    end
   methods
       function obj=labDevice(mode,varargin)
           obj.prop.mode=mode;
           switch (obj.prop.mode)
               case 'eth'
                   if length(varargin)~=2
                       error('ethernet interface got wrong number of input arguments')
                   end
                   obj.prop.adress=varargin{1};
                   obj.prop.port = varargin{2};
               case 'gpib'
                   if length(varargin)==1
                       obj.prop.gpib.primaryAdress=varargin{1};
                       obj.prop.gpib.boardIndex=1;
                       obj.prop.gpib.vendor='agilent';
                   elseif length(varargin)==2
                       obj.prop.gpib.primaryAdress=varargin{1};
                       obj.prop.gpib.boardIndex=varargin{2};
                       obj.prop.gpib.vendor='agilent';
                   elseif length(varargin)==3
                       obj.prop.gpib.primaryAdress=varargin{1};
                       obj.prop.gpib.boardIndex=varargin{2};
                       obj.prop.gpib.vendor=varargin{3};
                   else
                       error('gpib interface got wrong number of input arguments')
                   end

               otherwise
                   error('SMX: mode not supported')
           end
           addpath('.\functions');
           obj=openDev(obj);
       end
       
       function delete(obj)
           closeDev(obj);
       end
   end
 
end