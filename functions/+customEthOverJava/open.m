function obj = open(obj)
    import java.net.Socket
    import java.io.*

h = Socket(obj.prop.adress,obj.prop.port);

obj.prop.commHandle=h;

end