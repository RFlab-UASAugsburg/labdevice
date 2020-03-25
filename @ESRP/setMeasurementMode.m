% ====================================================
%> @brief Switch between the measurement modes
%>
%> - 'rec' for Receiver Mode
%> - 'spec' for Spectrum Mode
%>
%> @param obj Instance of class
%> @param mode [string] 'rec' or 'spec'
% =====================================================
function setMeasurementMode(obj, mode)
	switch mode
	    case 'rec'                      % receiver mode
	        write(obj, ['INST REC']);
	    case 'spec'                     % spectrum mode
	        write(obj, ['INST SAN']);
	    case 'iq'                       % IQ-Analyser mode
	         error('IQ Analyser Mode not supported remotely.');
		otherwise
	         error('Selected mode does not exist. (mode)');
	end
end