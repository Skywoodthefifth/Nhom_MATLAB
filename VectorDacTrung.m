function [ vec_dactrung ] = VectorDacTrung( folderName, fileName, fileFolderLength )
%VECTORDACTRUNG Summary of this function goes here
%   Detailed explanation goes here
N_FFT = 1024; %512 , 1024, 2048;            
sum = zeros(1,N_FFT);
 
      
  
for i=1:fileFolderLength
%      figure;
    
    individual_folderName=folderName((i-1)*5+1:5*i);
    audioName = ['THHL\' individual_folderName '\'  fileName];
    
    [y, Fs] = audioread(audioName); % doc du lieu tu file .wav
    y = y / max(abs(y)); % chuan hoa bien do ve [0;1]
    
    frame_indexes = DrawGraph(audioName);
    
%      t = [0 : 1 / Fs : length(y) / Fs];
%      t = t(1 : end - 1);
%     
%     subplot(2,1,1);
%     plot(t,y);
%     title(audioName);
    
%     subplot(2,2,2);
%     plot(t,y); hold on;
%     y1 = [-1  1];
%      for L= 1 : length(frame_indexes)
%           line(frame_indexes(L)*ones(size(y1)),y1,'Color', 'b', 'LineWidth', 1.5);
%      end
%      title('Ouput speech/silences using algorithm'); ylabel('Bien do'); xlabel('Thoi gian(s)'); legend('Input signal', 'STE');
            
            
            N_start=frame_indexes(1);
            N_end=frame_indexes(length(frame_indexes));
            
%             hold on
%                plot([1 1]*N_start, ylim, '-r')                               
%               hold off
              
%               hold on
%                plot([1 1]*N_end, ylim, '-r')                               
%               hold off
%               
               khoangchia=(N_end-N_start)/3;
%               
%               hold on
%                plot([1 1]*(N_start+khoangchia), ylim, '-r')                               
%               hold off
%               hold on
%                plot([1 1]*(N_start+2*khoangchia), ylim, '-r')                               
%               hold off
                
            
%         figure;
        khung_chia_start = round(Fs * (N_start+khoangchia));
        khung_chia_end = round(Fs * (N_start+2*khoangchia));

        khung_chia = y( khung_chia_start : khung_chia_end );
%          plot(khung_chia);
        
        f_d = 0.025; % do dai cua moi frame 
        n = f_d * Fs;  % so luong mau trong moi frame
        
        frames = DivFrame(khung_chia, n);
        
        individual_frame_fft = zeros(1, N_FFT);
        
        for j = 1: size(frames,1)
            temp_frame = frames(j, : );
            X1 = abs(fft(temp_frame, N_FFT));
            individual_frame_fft = individual_frame_fft + X1; %individual_frame_fft tra ve vector chua cac complex num
            
        end
        
        %vector dac trung 
        frame_fft = individual_frame_fft./size(frames,1);
%         figure;
%         freq = [0:Fs/N_FFT:Fs/2-1/Fs];
%         plot(freq, 20*log10(frame_fft(1:N_FFT/2)));
%         ylabel('FFT Magnitude'); xlabel('Frequency (Hz)'); grid;   

        sum  = sum + frame_fft;
        
        
        
end

vec_dactrung = sum./fileFolderLength;

end

