function obj = open(obj)
    import java.net.Socket
    import java.io.*

host = obj.prop.adress;
port = obj.prop.port;
number_of_retries = 20; % set to -1 for infinite
retry        = 0;
input_socket = [];
while true

    retry = retry + 1;
    if ((number_of_retries > 0) && (retry > number_of_retries))
        fprintf(1, 'Too many retries\n');
        break;
    end

    try
        fprintf(1, 'Attempt %d connecting to %s:%d\n', ...
                retry, host, port);

        % throws if unable to connect
        input_socket = Socket(host, port);
        break;
    catch aexception
        if ~isempty(input_socket)
            input_socket.close;
        end

        s = aexception.message;
        fprintf(1,s);
        % pause before retrying
        pause(1);
    end
end
obj.prop.commHandle=input_socket;
end