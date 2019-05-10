function obj=open(obj)

h=tcpip(obj.prop.adress,obj.prop.port);
fopen(h);
obj.prop.commHandle=h;

return