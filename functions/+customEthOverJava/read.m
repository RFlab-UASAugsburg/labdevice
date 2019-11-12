function ret = read(obj)
    timeout = 1;
    t = tic;
    import java.net.Socket
    import java.io.*
    h=obj.prop.commHandle;
    input_stream   = h.getInputStream;
    b_input_stream = BufferedInputStream(input_stream);
    bytes_available = b_input_stream.available;
%     ret = blanks(bytes_available);
    ret = '';
    for k=1:bytes_available
        ret(k)=char(b_input_stream.read);
    end

    while isempty(ret) && (toc(t) < timeout)
        bytes_available = input_stream.available;
        for k=1:bytes_available
            ret=[ret,char(b_input_stream.read)];
        end
    end
    if ~isempty(ret)
        while (ret(end) ~= newline) && (toc(t) < timeout)
            bytes_available = input_stream.available;
            for k=1:bytes_available
                ret=[ret,char(b_input_stream.read)];
            end
        end
    end
    if ~isempty(ret)
        ret = strip(ret);
        ret = textscan(ret,'%s', 'delimiter', ',;');
        for i = 1:length(ret)
            if ~isnan(str2double(ret{i}))
                ret{i} = str2double(ret{i});
            end
        end
        ret = ret{1};
    end
end