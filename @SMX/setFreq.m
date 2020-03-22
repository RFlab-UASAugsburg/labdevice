% ====================================================
%> @brief Set output frequency of signal generator
%>
%> @param obj Instance of class
%> @param freq Frequency [Hz]
%>
%> @return obj Instance of class
% =====================================================
function setFreq(obj, freq)

write(obj, ['RF ', num2str(freq)]);

% result = '000000';
% % Abfrage des Operation Complete Bit
% while str2num(result(6)) ~= 1
%     writeDev(obj, '*OPC?');
%     result = readDev(obj);
% end

end