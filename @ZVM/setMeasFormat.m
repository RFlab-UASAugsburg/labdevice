function setMeasFormat(obj,format)
%SETMEASFORMAT Set the measurement format
%   UPHase,PHASe,COMPlex,MAGNitude,PHASe,REAL,IMAGinary,SWR,GDELay
%   Detailed explanation goes here
if strcmpi("UPH",format)
    obj.write("CALC:FORM PHAS;*WAI");
    obj.write("CALC:FORM UPH");
else
    obj.write("CALC:FORM " + upper(format));
end

