function message = read(obj)
    import java.net.Socket
    import java.io.*
    input_socket = obj.prop.commHandle;
    number_of_retries = 20;
    retry = 0;
    while true
        retry = retry + 1;
        if ((number_of_retries > 0) && (retry > number_of_retries))
            fprintf(1, 'Too many retries\n');
            break;
        end
        try
            % get a buffered data input stream from the socket
            input_stream   = input_socket.getInputStream;
            d_input_stream = DataInputStream(input_stream);
            % read data from the socket - wait a short time first
            i = tic;
            bytes_available = input_stream.available;
            while bytes_available == 0 && toc(i) < 1
                pause(0.1);
                bytes_available = input_stream.available;
            end
                        
            data_reader = DataReader(d_input_stream);
            message = data_reader.readBuffer(bytes_available);
            message = strip(char(message'));
            bytes_available = input_stream.available;
            if bytes_available ~= 0
                message = [message read(obj)];
            end
            break;
        catch aexception
            s = aexception.message;
            fprintf(1,s);
            % pause before retrying
            pause(1);
        end
    end
end