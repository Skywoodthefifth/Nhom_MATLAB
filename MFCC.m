function [ vec_dactrung ] = MFCC( folderName, fileName, fileFolderLength )

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
%          plot(khung_chia);
        
%         f_d = 0.025; % do dai cua moi frame 
%         n = f_d * Fs;  % so luong mau trong moi frame
%         
%         frames = DivFrame(khung_chia, n);
%         
% %       individual_frame_mfcc = zeros(1, N_MFCC);
% 
%         temp_frame = frames(1, : );
%         coeffs = melcepst(temp_frame,Fs, 'M', N_MFCC, floor(3*log(Fs)), n , round(n/2), 0, 0.5);%'WindowLength',25,'OverlapLength',12,'numcoeffs',12
%         X1 = mean(coeffs,1);
%         individual_frame_mfcc = X1;
%         
%     for j = 2: size(frames,1)
%         temp_frame = frames(j, : );
%         coeffs = melcepst(temp_frame,Fs, 'M', N_MFCC, floor(3*log(Fs)), n , round(n/2), 0, 0.5);%'WindowLength',25,'OverlapLength',12,'numcoeffs',12
%         X1 = mean(coeffs,1);
%         individual_frame_mfcc = individual_frame_mfcc + X1;
%     end
%         
%         %vector dac trung 
%         frame_mfcc = individual_frame_mfcc./size(frames,1);

        coeffs = melcepst(khung_chia,Fs, 'M', N_MFCC, floor(3*log(Fs)), 0.030 * Fs , 0.020 * Fs, 0, 0.5);
        
        frame_mfcc = mean(coeffs,1);

        sum = frame_mfcc;







      
  
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
%         coeffs = melcepst(temp_frame,Fs, 'M', N_MFCC, floor(3*log(Fs)), n , round(n/2), 0, 0.5);%'WindowLength',25,'OverlapLength',12,'numcoeffs',12
%         X1 = mean(coeffs,1);
%         individual_frame_mfcc = X1;
%         
%     for j = 2: size(frames,1)
%         temp_frame = frames(j, : );
%         coeffs = melcepst(temp_frame,Fs, 'M', N_MFCC, floor(3*log(Fs)), n , round(n/2), 0, 0.5);%'WindowLength',25,'OverlapLength',12,'numcoeffs',12
%         X1 = mean(coeffs,1);
%         individual_frame_mfcc = individual_frame_mfcc + X1;
%     end
%         
%         %vector dac trung 
%         frame_mfcc = individual_frame_mfcc./size(frames,1);

        coeffs = melcepst(khung_chia,Fs, 'M', N_MFCC, floor(3*log(Fs)), 0.030 * Fs , 0.020 * Fs, 0, 0.5);
        
        frame_mfcc = mean(coeffs,1);

        sum = sum + frame_mfcc;
end


vec_dactrung = sum./fileFolderLength;


end

