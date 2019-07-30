%% Skipt um neue Funktionen zu testen
%
%
connection = 1; % 0 = GPIB
                % 1 = ETH

switch connection
    case 0
oGPIB = ESRP('gpib',20,1);
oGPIB.resetESRP();
% Testobjekt ist das neue Objekt
% Über GPIB wird der Messempfänger angesteuert
% Die Adresse ist: 20

    case 1
% Kommunikation z.B. über Ethernet:
oETH = ESRP('eth','141.82.73.167', 5025);
oETH.resetESRP();

end