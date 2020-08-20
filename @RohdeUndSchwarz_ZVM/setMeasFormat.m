% ======================================================================
%> @brief Set the measurement format
%>
%> UPHase,PHASe,COMPlex,MAGNitude,PHASe,REAL,IMAGinary,SWR,GDELay
%>
%> @param obj Instance of RohdeUndSchwarz_ZVM class
%> @param format one of: 'UPH','PHAS','COMP','MAGN','PHAS','REAL','IMAG','SWR','GDEL'
% ======================================================================
function setMeasFormat(obj,format)
	if strcmpi("UPH",format)
	    obj.write("CALC:FORM PHAS;*WAI");
	    obj.write("CALC:FORM UPH");
	else
	    obj.write("CALC:FORM " + upper(format));
	end
end
