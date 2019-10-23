function setMeasurementMode(obj, mode)
% 
% Switch between the measurement modes.
%   - Receiver Mode
%   - Spectrum Mode
%   - I/Q Analyser Mode
%
%
%   NOTE: I/Q Analyser Mode doesn't work atm
%
% (long description goes here)
%
%
% Parameters:
%	obj.prop:	labDevice Handle with properties
%            	- mode
%               - address
%               - port
%               - prop.comm(unication)Handle (interface specific)
%
%   mode:       [String]
%               rec      
%               spec     
%               newspec  
%               iq       
%
%   iqdata:     Only needs to set, if the IQ-Analyser is needed [String]
%               rim
%               magn
%               freq
%               vect
%
%
% Return values:
%   /
%
% See also:
%

switch mode
    case 'rec'                      % receiver mode
        write(obj, ['INST REC']);
    case 'spec'                     % spectrum mode
        write(obj, ['INST SAN']);
    %case 'newspec'
%     case 'iq'                       % IQ-Analyser mode
%         write(obj, ['TRAC:IQ']);
%         write(obj, ['TRAC:IQ:SET']);
%         switch iqdata              
%             case 'rim'
%                 write(obj, ['CALC:FORM:RIM']);
%             case 'magn'
%                 write(obj, ['CALC:FORM:MAGN']);
%             case 'freq'
%                 write(obj, ['CALC:FORM:FREQ']);
%             case 'vect'
%                 write(obj, ['CALC:FORM:VECT']);
%             otherwise
%                 error('Wrong display type of the IQ data. (iqdata)');
%        end
    otherwise
        error('Selected mode does not exist. (mode)');
end



end