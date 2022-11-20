close all;
clear;

folderName_THHL = ['01MDA', '02FVA', '03MAB', '04MHB', '05MVB', '06FTB', '07FTC', '08MLD', '09MPD', '10MSD','11MVD','12FTD','14FHH', '15MMH','16FTH','17MTH','18MNK', '19MXK', '20MVK', '21MTL', '22MHL'];


%So folder trong THHL va THKT
fileFolderLength = 21;

%Huan luyen vector dac trung
vector_dactrung_a_THHL = VectorDacTrung(folderName_THHL, 'a.wav', fileFolderLength);
vector_dactrung_u_THHL = VectorDacTrung(folderName_THHL, 'u.wav', fileFolderLength);
vector_dactrung_i_THHL = VectorDacTrung(folderName_THHL, 'i.wav', fileFolderLength);
vector_dactrung_e_THHL = VectorDacTrung(folderName_THHL, 'e.wav', fileFolderLength);
vector_dactrung_o_THHL = VectorDacTrung(folderName_THHL, 'o.wav', fileFolderLength);

vector_dactrung_a = vector_dactrung_a_THHL(1:round(length(vector_dactrung_a_THHL)/2));
vector_dactrung_u = vector_dactrung_u_THHL(1:round(length(vector_dactrung_u_THHL)/2));
vector_dactrung_i = vector_dactrung_i_THHL(1:round(length(vector_dactrung_i_THHL)/2));
vector_dactrung_e = vector_dactrung_e_THHL(1:round(length(vector_dactrung_e_THHL)/2));
vector_dactrung_o = vector_dactrung_o_THHL(1:round(length(vector_dactrung_o_THHL)/2));

f = figure('Name', 'Vector dac trung');
plot(vector_dactrung_a);
hold on;
plot(vector_dactrung_u);
hold on;
plot(vector_dactrung_i);
hold on;
plot(vector_dactrung_e);
hold on;
plot(vector_dactrung_o);
hold on;

legend({'/a/','/u/', '/i/', '/e/', '/o/'},'Location','north')

