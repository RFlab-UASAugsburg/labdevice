function ret=write(obj,txt)

fprintf(obj.prop.commHandle,'%s\r',txt);
ret=0;
return