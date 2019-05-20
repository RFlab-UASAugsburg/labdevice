function ret=read(obj)
ret=[];
timeout=1;
t=tic;
   while(toc(t)<timeout)
       if (obj.prop.commHandle.BytesAvailable>0)
         ret=[ret char(fread(obj.prop.commHandle,obj.prop.commHandle.BytesAvailable)')];
         if double(ret(end))==10
             return;
         end
       end
   end
disp('gpib.read: timeout')
end