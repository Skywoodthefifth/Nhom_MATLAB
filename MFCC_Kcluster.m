function [vector_K2, vector_K3, vector_K4, vector_K5] =    MFCC_Kcluster( folderName, fileName, fileFolderLength )
N_MFCC = 13;








    individual_folderName=folderName((1-1)*5+1:5*1);
    audioName = ['THHL\' individual_folderName '\'  fileName];
    
    [y, Fs] = audioread(audioName); % doc du lieu tu file .wav
    y = y / max(abs(y)); % chuan hoa bien do ve [0;1]
    
    %Phan tich tieng noi khoang lang
    frame_indexes = DrawGraph(audioName);       
    
    N_start=frame_indexes(1);
    N_end=frame_indexes(length(frame_indexes));
    
    %chia khoang tieng noi thanh 3 phan bang nhau va lay phan giua
    khoangchia=(N_end-N_start)/3;
    
    khung_chia_start = round(Fs * (N_start+khoangchia));
    khung_chia_end = round(Fs * (N_start+2*khoangchia));

        khung_chia = y( khung_chia_start : khung_chia_end );

        
%         f_d = 0.025; % do dai cua moi frame 
%         n = f_d * Fs;  % so luong mau trong moi frame
%         
%         frames = DivFrame(khung_chia, n);
%         
% 
% 
%         temp_frame = frames(1, : );
%         coeffs = melcepst(temp_frame,Fs, 'M', N_MFCC, floor(3*log(Fs)), 30 , 15, 0, 0.5);%'WindowLength',25,'OverlapLength',12,'numcoeffs',12
%         
%         K2 = kmeans(coeffs, 2).';
%         K3 = kmeans(coeffs, 3).';
%         K4 = kmeans(coeffs, 4).';
%         K5 = kmeans(coeffs, 5).';
%         
%         
%         
% 
% 
%         
%     for j = 2: size(frames,1)
%         temp_frame = frames(j, : );
%         coeffs = melcepst(temp_frame,Fs, 'M', N_MFCC, floor(3*log(Fs)), 30 , 15, 0, 0.5);%'WindowLength',25,'OverlapLength',12,'numcoeffs',12
%         K2 = K2 + kmeans(coeffs, 2).';
%         K3 = K3 + kmeans(coeffs, 3).';
%         K4 = K4 + kmeans(coeffs, 4).';
%         K5 = K5 + kmeans(coeffs, 5).';
%     end
%
%         %vector dac trung 
%         frame_mfcc_K2 = K2./size(frames,1);
%         frame_mfcc_K3 = K3./size(frames,1);
%         frame_mfcc_K4 = K4./size(frames,1);
%         frame_mfcc_K5 = K5./size(frames,1);

        frame = khung_chia(1:1024);

        coeffs = melcepst(frame,Fs, 'M', N_MFCC, floor(3*log(Fs)), 0.030 * Fs , 0.005 * Fs, 0, 0.5);
        
        %vector dac trung 
        frame_mfcc_K2 = kmeans(coeffs, 2).';
        frame_mfcc_K3 = kmeans(coeffs, 3).';
        frame_mfcc_K4 = kmeans(coeffs, 4).';
        frame_mfcc_K5 = kmeans(coeffs, 5).';
        

        sum_K2 = frame_mfcc_K2;
        sum_K3 = frame_mfcc_K3;
        sum_K4 = frame_mfcc_K4;
        sum_K5 = frame_mfcc_K5;
        







      
  
for i=2:fileFolderLength

    
    individual_folderName=folderName((i-1)*5+1:5*i);
    audioName = ['THHL\' individual_folderName '\'  fileName];
    
    [y, Fs] = audioread(audioName); % doc du lieu tu file .wav
    y = y / max(abs(y)); % chuan hoa bien do ve [0;1]
    
    %Phan tich tieng noi khoang lang
    frame_indexes = DrawGraph(audioName);       
    
    N_start=frame_indexes(1);
    N_end=frame_indexes(length(frame_indexes));
    
    %chia khoang tieng noi thanh 3 phan bang nhau va lay phan giua
    khoangchia=(N_end-N_start)/3;
    
    khung_chia_start = round(Fs * (N_start+khoangchia));
    khung_chia_end = round(Fs * (N_start+2*khoangchia));

        khung_chia = y( khung_chia_start : khung_chia_end );
%          plot(khung_chia);
        
%         f_d = 0.025; % do dai cua moi frame 
%         n = f_d * Fs;  % so luong mau trong moi frame
%         
%         frames = DivFrame(khung_chia, n);
%         
% %       individual_frame_mfcc = zeros(1, N_MFCC);
% 
%         temp_frame = frames(1, : );
%         coeffs = melcepst(temp_frame,Fs, 'M', N_MFCC, floor(3*log(Fs)), 30 , 15, 0, 0.5);%'WindowLength',25,'OverlapLength',12,'numcoeffs',12
%         
%         K2 = kmeans(coeffs, 2).';
%         K3 = kmeans(coeffs, 3).';
%         K4 = kmeans(coeffs, 4).';
%         K5 = kmeans(coeffs, 5).';
%         
%     for j = 2: size(frames,1)
%         temp_frame = frames(j, : );
%         coeffs = melcepst(temp_frame,Fs, 'M', N_MFCC, floor(3*log(Fs)), 30 , 15, 0, 0.5);%'WindowLength',25,'OverlapLength',12,'numcoeffs',12
%         K2 = K2 + kmeans(coeffs, 2).';
%         K3 = K3 + kmeans(coeffs, 3).';
%         K4 = K4 + kmeans(coeffs, 4).';
%         K5 = K5 + kmeans(coeffs, 5).';
%     end
%         
%         %vector dac trung 
%         frame_mfcc_K2 = K2./size(frames,1);
%         frame_mfcc_K3 = K3./size(frames,1);
%         frame_mfcc_K4 = K4./size(frames,1);
%         frame_mfcc_K5 = K5./size(frames,1);

        frame = khung_chia(1:1024);

        coeffs = melcepst(frame,Fs, 'M', N_MFCC, floor(3*log(Fs)), 0.030 * Fs , 0.005 * Fs, 0, 0.5);
        
        %vector dac trung 
        frame_mfcc_K2 = kmeans(coeffs, 2).';
        frame_mfcc_K3 = kmeans(coeffs, 3).';
        frame_mfcc_K4 = kmeans(coeffs, 4).';
        frame_mfcc_K5 = kmeans(coeffs, 5).';
        

        sum_K2 = sum_K2 + frame_mfcc_K2;
        sum_K3 = sum_K3 + frame_mfcc_K3;
        sum_K4 = sum_K4 + frame_mfcc_K4;
        sum_K5 = sum_K5 + frame_mfcc_K5;
end

vector_K2 = sum_K2./fileFolderLength; 
vector_K3 = sum_K3./fileFolderLength; 
vector_K4 = sum_K4./fileFolderLength; 
vector_K5 = sum_K5./fileFolderLength;

end

