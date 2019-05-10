function obj=close(obj)
fclose(obj.prop.commHandle.handle);
%delete(obj.prop.commHandle);

end