function setFreq(obj,freq)

% git-test-4

writeDev(obj,['RF ',num2str(freq)]);

% result='000000';
% % Abfrage des Operation Complete Bit
% while str2num(result(6)) ~= 1
%     writeDev(obj, '*OPC?');
%     result = readDev(obj);
% end

end