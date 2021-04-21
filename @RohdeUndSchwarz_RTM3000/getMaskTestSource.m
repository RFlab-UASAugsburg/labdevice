% ====================================================
%> @brief Gets the configured mask test source
%>
%> @param obj Instance of class
%>
%> @output maskTestSource Currently configured mask test source
%>
% =====================================================


function maskTestSource = getMaskTestSource(obj)
write(obj,"*WAI; MASK:SOUR?");
message = obj.read;
message = strip(message);
if strlength(message) == 0
    error("no response from device");
end
maskTestSource = message;
end