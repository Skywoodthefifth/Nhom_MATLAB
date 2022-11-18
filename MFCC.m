% function [ MFCC ] = MFCC( folderName, fileName, fileFolderLength )
% %VECTORDACTRUNG Huan luyen vector dac trung de so sanh Kiem Thu
% %   Ta se doc cac file tu folder THHL, tung nguyen am, trich xuat vector
% %   FFT dac trung cua tung file va Tinh trung binh cong vector dac trung cua
% %   tung nguyen am de tra ve
% N_MFCC = 13; % Khuong mau do dai vector FFT, thuong co gia tri 512 , 1024, 2048           
% sum = zeros(1,N_MFCC);
%  
%       
%   
% for i=1:fileFolderLength
% 
%     
%     individual_folderName=folderName((i-1)*5+1:5*i);
%     audioName = ['THHL\' individual_folderName '\'  fileName];
%     
%     [y, Fs] = audioread(audioName); % doc du lieu tu file .wav
%     y = y / max(abs(y)); % chuan hoa bien do ve [0;1]
%     
%     %Phan tich tieng noi khoang lang
%     frame_indexes = DrawGraph(audioName);       
%     
%     N_start=frame_indexes(1);
%     N_end=frame_indexes(length(frame_indexes));
%     
%     %chia khoang tieng noi thanh 3 phan bang nhau va lay phan giua
%     khoangchia=(N_end-N_start)/3;
%     
%     khung_chia_start = round(Fs * (N_start+khoangchia));
%     khung_chia_end = round(Fs * (N_start+2*khoangchia));
% 
%         khung_chia = y( khung_chia_start : khung_chia_end );
% %          plot(khung_chia);
%         
%         f_d = 0.025; % do dai cua moi frame 
%         n = f_d * Fs;  % so luong mau trong moi frame
%         
%         frames = DivFrame(khung_chia, n);
%         
%         individual_frame_mfcc = zeros(1, N_MFCC);
%         
%     for j = 1: size(frames,1)
%         temp_frame = frames(:, j );
%         coeffs = mfcc(temp_frame,Fs);%'WindowLength',25,'OverlapLength',12,'numcoeffs',12
%         X1 = abs(coeffs)./length(temp_frame);%X1 tra ve vector chua cac complex num 
%         individual_frame_mfcc = individual_frame_mfcc + X1;
%     end
%         
%         %vector dac trung 
%         frame_mfcc = individual_frame_mfcc./size(frames,1);
% 
%         sum  = sum + frame_mfcc;
%         
%         
%         
% end
% 
% MFCC = sum./fileFolderLength;
% end
% 
