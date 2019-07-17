function setStartFreq(obj, freq)

writeDev(obj, ['FREQ:STAR ', num2str(freq), 'Hz; *WAI']);

% result='000000';
% % Abfrage des Operation Complete Bit
% while str2num(result(6)) ~= 1
%     writeDev(obj, '*OPC?');
%     result = readDev(obj);
% end

end