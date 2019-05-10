classdef  SMX
    properties
      prop
    end
   methods
       function obj=SMX(mode,adress)
           obj.prop.mode=mode;
           obj.prop.adress=adress;
           obj.prop.commHandle=openDev(obj);
       end
   end
 
end