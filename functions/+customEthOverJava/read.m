function ret = read(obj)
ret = [];
timeout = 1;
t = tic;
import java.net.Socket
import java.io.*
h=obj.prop.commHandle;
input_stream   = h.getInputStream;
d_input_stream = DataInputStream(input_stream);
bytes_available = input_stream.available;
ret = blanks(bytes_available);
for k=1:bytes_available
    ret(k)=char(d_input_stream.read);
end

while isempty(ret) && (toc(t) < timeout)
    %               [ret, ~, msg] = [ret, cell2mat(scanstr(obj.prop.commHandle,''))];
    bytes_available = input_stream.available;
    for k=1:bytes_available
        ret=[ret,char(d_input_stream.read)];
    end
end
ret = strip(ret);
end