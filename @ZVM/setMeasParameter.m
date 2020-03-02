function setMeasParameter(obj,param)
%SETMEASPARAMETER set the parameter to measure, in frequency sweep mode
%while measuring power
%   param:      Measurement parameter, for example , "Z21" or "S11"

obj.write("SENSE:FUNC 'XFR:POW:" + param + "'")
end

