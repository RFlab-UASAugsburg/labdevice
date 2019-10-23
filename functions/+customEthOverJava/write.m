function ret = write(obj,txt)
import java.net.Socket
import java.io.*
h=obj.prop.commHandle;
output_stream   = h.getOutputStream;
d_output_stream = DataOutputStream(output_stream);
d_output_stream.writeBytes(char(txt));
d_output_stream.flush;

%fprintf(obj.prop.commHandle, '%s\n', txt);
ret = 0;
return