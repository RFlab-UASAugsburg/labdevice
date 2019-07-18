function ret = write(obj,txt)

fprintf(obj.prop.commHandle, '%s\n', txt);
ret = 0;
return