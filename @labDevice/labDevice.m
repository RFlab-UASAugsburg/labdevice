classdef  labDevice
%labDevice Superclass for all labdevices
%
% Handling of the default values is done here. 
% At the moment just ethernet and gpib connections can be established.
% The connection mode needs to be handed over. There is no corresponding
% default property for it.
%
%   dev = labDevice(deviceName, conMode) returns labDevice object, dev,
%   with default values for the parameters of the connection mode conMode.
%
%
% Parameters of Constructor:
%  mode:         connection mode (eth or gpib at the moment)
%  
%
% Return values of Constructor:
%  obj:         lab Device Handle with properties
%                - mode
%                - address
%                - port
%                - comm(unication)Handle (interface specific)
%
% See also: write, read, flush
% 
% References: 

    properties
      prop
    end
    methods
        function obj = labDevice(deviceName, mode, varargin)
            % Quickfix: No idea why, but sometimes varargin is a {1}{2} 
            % array, sometimes not.
            if nargin ~= length(varargin)
                varargin = varargin{1};
            end
            obj.prop.mode = mode;
            
            % Search for default configs
            defaultProps=getDefaultDeviceProperties(deviceName);
            switch (obj.prop.mode)                
                case 'eth'
                    if isempty(varargin)
                        % Take eth default for connection
                        if isfield(defaultProps, 'eth')
                            obj.prop.port=defaultProps.eth.port;
                            obj.prop.adress=defaultProps.eth.ip;
                        else
                            % Coudnt find default properties.
                            error('Couldnt find default properties for ethernet interface')
                        end
                    elseif length(varargin) == 2
                        obj.prop.adress = varargin{1};
                        obj.prop.port   = varargin{2};
                    elseif length(varargin) > 2 || length(varargin) == 1
                        error('ethernet interface got wrong number of input arguments')
                    end

                case 'gpib'
                    if isempty(varargin)
                        % Take GPIB default for connection
                        if isfield(defaultProps,'gpib')
                            obj.prop.gpib.primaryAdress  = defaultProps.gpib.address;
                            obj.prop.gpib.boardIndex     = defaultProps.gpib.boardIdx;
                            obj.prop.gpib.vendor         = defaultProps.gpib.vendor;
                        else
                            % Coudnt find default properties.
                            error('Couldnt find default properties for GPIB interface')
                        end
                    elseif length(varargin) == 1
                        obj.prop.gpib.primaryAdress  = [varargin{1}];
                        obj.prop.gpib.boardIndex     = 1;
                        obj.prop.gpib.vendor         = 'agilent'; % ni is standard for R&S devices.
                    elseif length(varargin) == 2
                        obj.prop.gpib.primaryAdress  = varargin{1};
                        obj.prop.gpib.boardIndex	 = varargin{2};
                        obj.prop.gpib.vendor		 = 'agilent'; % ni is standard for R&S devices.
                    elseif length(varargin) == 3
                       obj.prop.gpib.primaryAdress	 = varargin{1};
                       obj.prop.gpib.boardIndex		 = varargin{2};
                       obj.prop.gpib.vendor 		 = varargin{3};
                   else
                       error('gpib interface got wrong number of input arguments')
                   end

                otherwise
                    warning('LabDevice Interface: Using default connection settings: GPIB')
                    % Take GPIB default for connection
                    if isfield(defaultProps.gpib)
                        obj.prop.gpib.primaryAdress  = defaultProps.gpib.address;
                        obj.prop.gpib.boardIndex     = defaultProps.gpib.boardIdx;
                        obj.prop.gpib.vendor         = defaultProps.gpib.vendor;
                    else
                        % Coudnt find default properties.
                        error('Couldnt find default properties for GPIB interface')
                    end
            end
            
           obj = openDev(obj);
           
           % Apply the additional device specific Communication Parameters 
           % to connection
           if isfield(defaultProps, 'additionalCommunicationParameters')
               obj = closeDev(obj);
                fields=fieldnames(defaultProps.additionalCommunicationParameters);
                for addCommParaIdx=1:numel(fields)
                    set(obj.prop.commHandle, fields{addCommParaIdx},defaultProps.additionalCommunicationParameters.(fields{addCommParaIdx}));
                end
                obj = openDev(obj);
           end
         
           

       end
       
       function delete(obj)
           closeDev(obj);
       end
       
       % Declare the function signatures of all other functions in folder
       flush(obj);
       write(obj, txt);
       ret = read(obj);
   end
 
end