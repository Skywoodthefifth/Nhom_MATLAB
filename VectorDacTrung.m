function [ vec_dactrung_a ] = VectorDacTrung( folderName, fileName )
%VECTORDACTRUNG Summary of this function goes here
%   Detailed explanation goes here
N_FFT = 512; %1024 , 2048;            
sum = zeros(1,N_FFT);
 
      
  
for i=1:21
    %figure;
    
    tenthumuc=folderName((i-1)*5+1:5*i);
    audioName = ['THHL\' tenthumuc '\'  fileName];
    
    [y, Fs] = audioread(audioName); % doc du lieu tu file .wav
    y = y / max(abs(y)); % chuan hoa bien do ve [0;1]
    
    index_frame = DrawGraph(audioName);
    
    t = [0 : 1 / Fs : length(y) / Fs];
    t = t(1 : end - 1);
    
    %plot(t,y);
    %title(audioName);
    
    
            
            
            N_start=index_frame(1);
            N_end=index_frame(length(index_frame));
            
%             hold on
%                plot([1 1]*N_start, ylim, '-r')                               
%               hold off
%               
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
        khung_frame = y( Fs * (N_start+khoangchia) : Fs * (N_start+2*khoangchia) );
%         plot(khung_frame);
        
        f_d = 0.020; % do dai cua moi frame la 25ms
        n = f_d * Fs;  % so luong mau trong moi frame
        
        frames = DivFrame(khung_frame, n);
        
       
        
        frame_fft = zeros(1, N_FFT);
        
        for j = 1: size(frames,1)
            temp_frame = frames(j, : );
            
            frame_fft = frame_fft + fft(temp_frame, N_FFT);
        end
        
        %vector dac trung 
        frame_fft = frame_fft./size(frames,1);
            
        sum  = sum + frame_fft;
        
        
        
end


vec_dactrung_a = sum ./ 21;

end

