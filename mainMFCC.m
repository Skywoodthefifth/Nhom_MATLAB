close all;
clear;

folderName_THHL = ['01MDA', '02FVA', '03MAB', '04MHB', '05MVB', '06FTB', '07FTC', '08MLD', '09MPD', '10MSD','11MVD','12FTD','14FHH', '15MMH','16FTH','17MTH','18MNK', '19MXK', '20MVK', '21MTL', '22MHL'];
folderName_THKT = ['23MTL', '24FTL', '25MLM', '27MCM', '28MVN', '29MHN', '30FTN', '32MTP', '33MHP', '34MQP','35MMQ','36MAQ','37MDS', '38MDS','39MTS','40MHS','41MVS', '42FQT', '43MNT', '44MTT', '45MDV'];

%So folder trong THHL va THKT
fileFolderLength = 21;

%Huan luyen vector dac trung
vector_dactrung_a_THHL = MFCC(folderName_THHL, 'a.wav', fileFolderLength);
vector_dactrung_u_THHL = MFCC(folderName_THHL, 'u.wav', fileFolderLength);
vector_dactrung_i_THHL = MFCC(folderName_THHL, 'i.wav', fileFolderLength);
vector_dactrung_e_THHL = MFCC(folderName_THHL, 'e.wav', fileFolderLength);
vector_dactrung_o_THHL = MFCC(folderName_THHL, 'o.wav', fileFolderLength);


[check_a_a, check_a_u, check_a_i, check_a_e, check_a_o] = MFCCsosanh( folderName_THKT, 'a.wav', fileFolderLength, vector_dactrung_a_THHL, vector_dactrung_u_THHL, vector_dactrung_i_THHL, vector_dactrung_e_THHL, vector_dactrung_o_THHL);
[check_u_a, check_u_u, check_u_i, check_u_e, check_u_o] = MFCCsosanh( folderName_THKT, 'u.wav', fileFolderLength, vector_dactrung_a_THHL, vector_dactrung_u_THHL, vector_dactrung_i_THHL, vector_dactrung_e_THHL, vector_dactrung_o_THHL);
[check_i_a, check_i_u, check_i_i, check_i_e, check_i_o] = MFCCsosanh( folderName_THKT, 'i.wav', fileFolderLength, vector_dactrung_a_THHL, vector_dactrung_u_THHL, vector_dactrung_i_THHL, vector_dactrung_e_THHL, vector_dactrung_o_THHL);
[check_e_a, check_e_u, check_e_i, check_e_e, check_e_o] = MFCCsosanh( folderName_THKT, 'e.wav', fileFolderLength, vector_dactrung_a_THHL, vector_dactrung_u_THHL, vector_dactrung_i_THHL, vector_dactrung_e_THHL, vector_dactrung_o_THHL);
[check_o_a, check_o_u, check_o_i, check_o_e, check_o_o] = MFCCsosanh( folderName_THKT, 'o.wav', fileFolderLength, vector_dactrung_a_THHL, vector_dactrung_u_THHL, vector_dactrung_i_THHL, vector_dactrung_e_THHL, vector_dactrung_o_THHL);

%<--- khoi tao bang thong ke
check = zeros(5,5);

check(1,1) = check_a_a;
check(1,2) = check_a_u;
check(1,3) = check_a_i;
check(1,4) = check_a_e;
check(1,5) = check_a_o;

check(2,1) = check_u_a;
check(2,2) = check_u_u;
check(2,3) = check_u_i;
check(2,4) = check_u_e;
check(2,5) = check_u_o;

check(3,1) = check_i_a;
check(3,2) = check_i_u;
check(3,3) = check_i_i;
check(3,4) = check_i_e;
check(3,5) = check_i_o;

check(4,1) = check_e_a;
check(4,2) = check_e_u;
check(4,3) = check_e_i;
check(4,4) = check_e_e;
check(4,5) = check_e_o;

check(5,1) = check_o_a;
check(5,2) = check_o_u;
check(5,3) = check_o_i;
check(5,4) = check_o_e;
check(5,5) = check_o_o;

h = figure;
data = check;
u = uitable('Position',[20 20 500 70],'data',data);
u.RowName = {'a','u','i','e','o'};
u.ColumnName = {'a','u','i','e','o'};
table_extent = get(u,'Extent');
set(u,'Position',[1 1 table_extent(3) table_extent(4)])
figure_size = get(h,'outerposition');
desired_fig_size = [figure_size(1) figure_size(2) table_extent(3)+15 table_extent(4)+65+20];
set(h,'outerposition', desired_fig_size);