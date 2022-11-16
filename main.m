close all;
clear;

folderName_THHL = ['01MDA', '02FVA', '03MAB', '04MHB', '05MVB', '06FTB', '07FTC', '08MLD', '09MPD', '10MSD','11MVD','12FTD','14FHH', '15MMH','16FTH','17MTH','18MNK', '19MXK', '20MVK', '21MTL', '22MHL'];
folderName_THKT = ['23MTL', '24FTL', '25MLM', '27MCM', '28MVN', '29MHN', '30FTN', '32MTP', '33MHP', '34MQP','35MMQ','36MAQ','37MDS', '38MDS','39MTS','40MHS','41MVS', '42FQT', '43MNT', '44MTT', '45MDV'];
 
fileFolderLength = 21;
            
vector_dactrung_a_THHL = VectorDacTrung(folderName_THHL, 'a.wav', fileFolderLength);
vector_dactrung_u_THHL = VectorDacTrung(folderName_THHL, 'u.wav', fileFolderLength);
vector_dactrung_i_THHL = VectorDacTrung(folderName_THHL, 'i.wav', fileFolderLength);
vector_dactrung_e_THHL = VectorDacTrung(folderName_THHL, 'e.wav', fileFolderLength);
vector_dactrung_o_THHL = VectorDacTrung(folderName_THHL, 'o.wav', fileFolderLength);

[check_a_a, check_a_u, check_a_i, check_a_e, check_a_o] = SoSanhVectorDacTrung( folderName_THKT, 'a.wav', fileFolderLength, vector_dactrung_a_THHL, vector_dactrung_u_THHL, vector_dactrung_i_THHL, vector_dactrung_e_THHL, vector_dactrung_o_THHL);
[check_u_a, check_u_u, check_u_i, check_u_e, check_u_o] = SoSanhVectorDacTrung( folderName_THKT, 'u.wav', fileFolderLength, vector_dactrung_a_THHL, vector_dactrung_u_THHL, vector_dactrung_i_THHL, vector_dactrung_e_THHL, vector_dactrung_o_THHL);
[check_i_a, check_i_u, check_i_i, check_i_e, check_i_o] = SoSanhVectorDacTrung( folderName_THKT, 'i.wav', fileFolderLength, vector_dactrung_a_THHL, vector_dactrung_u_THHL, vector_dactrung_i_THHL, vector_dactrung_e_THHL, vector_dactrung_o_THHL);
[check_e_a, check_e_u, check_e_i, check_e_e, check_e_o] = SoSanhVectorDacTrung( folderName_THKT, 'e.wav', fileFolderLength, vector_dactrung_a_THHL, vector_dactrung_u_THHL, vector_dactrung_i_THHL, vector_dactrung_e_THHL, vector_dactrung_o_THHL);
[check_o_a, check_o_u, check_o_i, check_o_e, check_o_o] = SoSanhVectorDacTrung( folderName_THKT, 'o.wav', fileFolderLength, vector_dactrung_a_THHL, vector_dactrung_u_THHL, vector_dactrung_i_THHL, vector_dactrung_e_THHL, vector_dactrung_o_THHL);




