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
        objESRP = ESRP('gpib', 20, 1);
        objESRP.resetESRP();

    case 1
        objESRP = ESRP('eth', '141.82.73.167', 5025);
        objESRP.resetESRP();

end