function DatenVNA = getTraceCmplx(obj,channel,f_points)
%GETTRACE Summary of this function goes here
%   Detailed explanation goes here
obj.read();
obj.write(['TRAC? CH',num2str(channel),'DATA;*WAI'])
pause(0.1);
data = obj.read();
i = 0;
while length(sscanf(data,'%f,')) < f_points*2
    if i > 5
        error("read timeout from VNA");
    end
    pause(0.1)
    data = [data obj.read];
    disp(data);
    i = i+1;
end
data = sscanf(data,'%f,',[2 f_points]);
DatenVNA=(data(1,:)+1j.*data(2,:))';
end

