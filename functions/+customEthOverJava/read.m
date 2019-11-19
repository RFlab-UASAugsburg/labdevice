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

            fprintf(1, 'Connected to server\n');

            % read data from the socket - wait a short time first
            pause(0.1);
            bytes_available = input_stream.available;
            fprintf(1, 'Reading %d bytes\n', bytes_available);
                        
            data_reader = DataReader(d_input_stream);
            message = data_reader.readBuffer(bytes_available);
            message = char(message');
            break;
        catch aexception
            s = aexception.message;
            fprintf(1,s);
            % pause before retrying
            pause(1);
        end
    end
    if ~isempty(message)
        message = strip(message);
        message = textscan(message,'%s', 'delimiter', ',;');
        if ~isnan(str2double(message{1}))
            message{1} = str2double(message{1});
            message = cell2mat(message);
            if length(message) == 1
                message = message(1);
            end
        else
            message = message{1};
            for i=1:length(message)
                if ~isnan(str2double(message(i)))
                    message{i} = str2double(message(i));
                end
            end
        end
        if length(message) == 1 && isa(message,'cell')
                message = message{1};
        end
    end
end