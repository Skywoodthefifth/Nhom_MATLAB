close all;
clear;

folderName_THHL = ['01MDA', '02FVA', '03MAB', '04MHB', '05MVB', '06FTB', '07FTC', '08MLD', '09MPD', '10MSD','11MVD','12FTD','14FHH', '15MMH','16FTH','17MTH','18MNK', '19MXK', '20MVK', '21MTL', '22MHL'];
folderName_THKT = ['23MTL', '24FTL', '25MLM', '27MCM', '28MVN', '29MHN', '30FTN', '32MTP', '33MHP', '34MQP','35MMQ','36MAQ','37MDS', '38MDS','39MTS','40MHS','41MVS', '42FQT', '43MNT', '44MTT', '45MDV'];

%So folder trong THHL va THKT
fileFolderLength = 21;

K2 = 2;
K3 = 3;
K4 = 4;
K5 = 5;

%Huan luyen vector dac trung
[ vector_K2_a, vector_K3_a, vector_K4_a,vector_K5_a ] = MFCC_Kcluster(folderName_THHL, 'a.wav' , fileFolderLength);
[ vector_K2_u, vector_K3_u, vector_K4_u,vector_K5_u ] = MFCC_Kcluster(folderName_THHL, 'u.wav' , fileFolderLength);
[ vector_K2_i, vector_K3_i, vector_K4_i,vector_K5_i ] = MFCC_Kcluster(folderName_THHL, 'i.wav' , fileFolderLength);
[ vector_K2_e, vector_K3_e, vector_K4_e,vector_K5_e ] = MFCC_Kcluster(folderName_THHL, 'e.wav' , fileFolderLength);
[ vector_K2_o, vector_K3_o, vector_K4_o,vector_K5_o ] = MFCC_Kcluster(folderName_THHL, 'o.wav' , fileFolderLength);

f2 = figure('Name', 'Vector dac trung MFCC K2');
hold on;
plot(vector_K2_a);
plot(vector_K2_u);
plot(vector_K2_i);
plot(vector_K2_e);
plot(vector_K2_o);
title('Vector dac trung MFCC');
legend({'/a/','/u/', '/i/', '/e/', '/o/'},'Location','north');
hold off;

f3 = figure('Name', 'Vector dac trung MFCC K3');
hold on;
plot(vector_K3_a);
plot(vector_K3_u);
plot(vector_K3_i);
plot(vector_K3_e);
plot(vector_K3_o);
title('Vector dac trung MFCC');
legend({'/a/','/u/', '/i/', '/e/', '/o/'},'Location','north');
hold off;

f4 = figure('Name', 'Vector dac trung MFCC K4');
hold on;
plot(vector_K4_a);
plot(vector_K4_u);
plot(vector_K4_i);
plot(vector_K4_e);
plot(vector_K4_o);
title('Vector dac trung MFCC');
legend({'/a/','/u/', '/i/', '/e/', '/o/'},'Location','north');
hold off;

f5 = figure('Name', 'Vector dac trung MFCC K5');
hold on;
plot(vector_K5_a);
plot(vector_K5_u);
plot(vector_K5_i);
plot(vector_K5_e);
plot(vector_K5_o);
title('Vector dac trung MFCC');
legend({'/a/','/u/', '/i/', '/e/', '/o/'},'Location','north');
hold off;

[check_a_a_K, check_a_u_K, check_a_i_K, check_a_e_K, check_a_o_K] = MFCCsosanh_Kcluster( folderName_THKT, 'a.wav', fileFolderLength, vector_K2_a, vector_K2_u, vector_K2_i, vector_K2_e, vector_K2_o ,  vector_K3_a, vector_K3_u, vector_K3_i, vector_K3_e, vector_K3_o ,  vector_K4_a, vector_K4_u, vector_K4_i, vector_K4_e, vector_K4_o ,  vector_K5_a, vector_K5_u, vector_K5_i, vector_K5_e, vector_K5_o);
[check_u_a_K, check_u_u_K, check_u_i_K, check_u_e_K, check_u_o_K] = MFCCsosanh_Kcluster( folderName_THKT, 'u.wav', fileFolderLength, vector_K2_a, vector_K2_u, vector_K2_i, vector_K2_e, vector_K2_o ,  vector_K3_a, vector_K3_u, vector_K3_i, vector_K3_e, vector_K3_o ,  vector_K4_a, vector_K4_u, vector_K4_i, vector_K4_e, vector_K4_o ,  vector_K5_a, vector_K5_u, vector_K5_i, vector_K5_e, vector_K5_o);
[check_i_a_K, check_i_u_K, check_i_i_K, check_i_e_K, check_i_o_K] = MFCCsosanh_Kcluster( folderName_THKT, 'i.wav', fileFolderLength, vector_K2_a, vector_K2_u, vector_K2_i, vector_K2_e, vector_K2_o ,  vector_K3_a, vector_K3_u, vector_K3_i, vector_K3_e, vector_K3_o ,  vector_K4_a, vector_K4_u, vector_K4_i, vector_K4_e, vector_K4_o ,  vector_K5_a, vector_K5_u, vector_K5_i, vector_K5_e, vector_K5_o);
[check_e_a_K, check_e_u_K, check_e_i_K, check_e_e_K, check_e_o_K] = MFCCsosanh_Kcluster( folderName_THKT, 'e.wav', fileFolderLength, vector_K2_a, vector_K2_u, vector_K2_i, vector_K2_e, vector_K2_o ,  vector_K3_a, vector_K3_u, vector_K3_i, vector_K3_e, vector_K3_o ,  vector_K4_a, vector_K4_u, vector_K4_i, vector_K4_e, vector_K4_o ,  vector_K5_a, vector_K5_u, vector_K5_i, vector_K5_e, vector_K5_o);
[check_o_a_K, check_o_u_K, check_o_i_K, check_o_e_K, check_o_o_K] = MFCCsosanh_Kcluster( folderName_THKT, 'o.wav', fileFolderLength, vector_K2_a, vector_K2_u, vector_K2_i, vector_K2_e, vector_K2_o ,  vector_K3_a, vector_K3_u, vector_K3_i, vector_K3_e, vector_K3_o ,  vector_K4_a, vector_K4_u, vector_K4_i, vector_K4_e, vector_K4_o ,  vector_K5_a, vector_K5_u, vector_K5_i, vector_K5_e, vector_K5_o);




%<--- khoi tao bang thong ke
check = zeros(5,5);

check(1,1) = check_a_a_K;
check(1,2) = check_a_u_K;
check(1,3) = check_a_i_K;
check(1,4) = check_a_e_K;
check(1,5) = check_a_o_K;

check(2,1) = check_u_a_K;
check(2,2) = check_u_u_K;
check(2,3) = check_u_i_K;
check(2,4) = check_u_e_K;
check(2,5) = check_u_o_K;

check(3,1) = check_i_a_K;
check(3,2) = check_i_u_K;
check(3,3) = check_i_i_K;
check(3,4) = check_i_e_K;
check(3,5) = check_i_o_K;

check(4,1) = check_e_a_K;
check(4,2) = check_e_u_K;
check(4,3) = check_e_i_K;
check(4,4) = check_e_e_K;
check(4,5) = check_e_o_K;

check(5,1) = check_o_a_K;
check(5,2) = check_o_u_K;
check(5,3) = check_o_i_K;
check(5,4) = check_o_e_K;
check(5,5) = check_o_o_K;

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