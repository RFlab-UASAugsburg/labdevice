function ret = read(obj)
ret = [];
timeout = 1;
t = tic;
%   while(toc(t) < timeout)
%       if (obj.prop.commHandle.BytesAvailable > 0) % Doesnt work. no idea why.

            while isempty(ret) && toc(t) < timeout
%               [ret, ~, msg] = [ret, cell2mat(scanstr(obj.prop.commHandle,''))];

                ret = [ret, cell2mat(scanstr(obj.prop.commHandle,''))];
%               This doesnt work. Doesnt send a newline, what is the EOS here?

                if double(ret(end)) == 10 % Search for newline
                    return;
                end
            end
%       end
%   end
disp('customGpib.read: timeout')

end