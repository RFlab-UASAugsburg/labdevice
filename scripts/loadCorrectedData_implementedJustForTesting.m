function [f_AF, AF3m, AF10m, f_att, att] = loadCorrectedData_implementedJustForTesting()

fid = fopen('./correctedData/Antennenfaktor.csv');
if fid == -1
    disp('Error ')
else
data = textscan(fid, '%f %f %f', 'delimiter', ',', 'headerlines', 7);
fclose(fid);
end

f_AF  = data{1} * 1e6;
AF3m  = data{2};
AF10m = data{3};

fid  = fopen('./correctedData/Leitungsdaempfung_EMV_Messungen.csv');
data = textscan(fid, '%f %f %f', 'delimiter', ',', 'headerlines', 2);
fclose(fid);

f_att = data{1} * 1e6;
att   = data{2}; 