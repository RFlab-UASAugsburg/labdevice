%% Skipt um neue Funktionen zu testen
%
%

tObj = ESRP('gpib',20,1);
% Testobjekt ist das neue Objekt
% Über GPIB wird der Messempfänger angesteuert
% Die Adresse ist: 20

%% Kommunikation z.B. über Ethernet:

tObjEth = ESRP('eth','141.82.73.167', 5025);
tObjEth.resetESRP();
