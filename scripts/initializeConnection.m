%% Establish the connection w/ the ESRP
%
%
%

instrreset; % Disconnect and delete all instrument objects

%% Choose the requiered connection type
connection = 1; % 0 = GPIB
                % 1 = ETH
                
switch connection
    case 0
oGPIB = ESRP('gpib', 20, 1);
%oGPIB.set('InputBufferSize',  2^24);
%oGPIB.set('OutputBufferSize', 2^24);
%oGPIB.set('Timeout',          30);
%oGPIB.set('EOSCharCode',      0);


oGPIB.resetESRP();
    case 1
        
% Kommunikation z.B. über Ethernet:
oETH = ESRP('eth', '141.82.73.167', 5025);

oETH.resetESRP();

end