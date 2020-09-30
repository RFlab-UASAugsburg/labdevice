% ======================================================================
%> @brief get the averaged E-field value of all axis
%>
%> @param obj Instance of RadiSense_EFieldProbe class
%>
%> @return ret Data read from device
% ======================================================================
function ret = getField(obj)
%   enable all axis, extract the measurement from returned data. The sensor
%   returns the euclidian norm of all enabled axis.
obj.write("AEEE");
obj.read;
obj.write("D2");
response = read(obj);
if length(response) ~= 18
    msgID = "RADISENSE:WeirdError";
    msg = "something went wrong: " + response;
    throw(MException(msgID,msg));
%elseif response(14) == "O"
%    msgID = "RADISENSE:OverRange";
%    msg = "Probe returned over range warning!";
%    throw(MException(msgID,msg));
end
ret = double(string(extractBetween(response,3,7)));
end