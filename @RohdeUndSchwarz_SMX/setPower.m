% ====================================================
%> @brief Set output power level of signal generator
%>
%> @param obj Instance of class
%> @param pow Power level [dBm]
% =====================================================
function setPower(obj,pow)

if pow > 0 % RohdeUndSchwarz_SMX Specific
    fprintf('Power Level too high!\n');
    return
end

write(obj, ['L ', num2str(pow)]);

end