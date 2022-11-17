function [ check_a, check_u, check_i, check_e, check_o ] = SoSanhVectorDacTrung( folderName_THKT, fileName, fileFolderLength, vector_dactrung_a_THHL, vector_dactrung_u_THHL, vector_dactrung_i_THHL, vector_dactrung_e_THHL, vector_dactrung_o_THHL )
%SOSANHVECTORDACTRUNG Summary of this function goes here
%   Detailed explanation goes here
N_FFT = 1024; %512 , 1024, 2048; 
check_a =0;
check_u =0;
check_i =0;
check_e =0;
check_o =0;


for i=1:fileFolderLength

    
    tenthumuc=folderName_THKT((i-1)*5+1:5*i);
    audioName = ['THKT\' tenthumuc '\'  fileName];
    
    [y, Fs] = audioread(audioName); % doc du lieu tu file .wav
    y = y / max(abs(y)); % chuan hoa bien do ve [0;1]
    
    index_frame = DrawGraph(audioName);
    
%     t = [0 : 1 / Fs : length(y) / Fs];
%     t = t(1 : end - 1);

    
            
            
    N_start=index_frame(1);
    N_end=index_frame(length(index_frame));

    khoangchia=(N_end-N_start)/3;

        khung_frame_start = round(Fs * (N_start+khoangchia));
        khung_frame_end = round(Fs * (N_start+2*khoangchia));

    khung_frame = y( khung_frame_start : khung_frame_end );


    f_d = 0.025; % do dai cua moi frame
    n = f_d * Fs;  % so luong mau trong moi frame

    frames = DivFrame(khung_frame, n);



    frame_fft = zeros(1, N_FFT); 

    for j = 1: size(frames,1)
        temp_frame = frames(j, : );
        
        individual_frame_fft_temp = fft(temp_frame, N_FFT);
            
            individual_frame_fft_temp = fftshift(individual_frame_fft_temp);
            individual_frame_fft_temp= abs(individual_frame_fft_temp).^2/length(individual_frame_fft_temp);

        frame_fft = frame_fft + individual_frame_fft_temp; 
    end

    %vector dac trung 
    frame_fft = frame_fft./size(frames,1);
    
    
    
    d_frame_fft_auieo = zeros(1, 5);
    
    d_frame_fft_auieo(1) = Euclidean(frame_fft, vector_dactrung_a_THHL);
    d_frame_fft_auieo(2) = Euclidean(frame_fft, vector_dactrung_u_THHL);
    d_frame_fft_auieo(3) = Euclidean(frame_fft, vector_dactrung_i_THHL);
    d_frame_fft_auieo(4) = Euclidean(frame_fft, vector_dactrung_e_THHL);
    d_frame_fft_auieo(5) = Euclidean(frame_fft, vector_dactrung_o_THHL);
    
    [~ ,min_d_index] = min(d_frame_fft_auieo);
%     min_d_index = 0;
%     min_d = min(d_frame_fft_auieo);
%     for k = 1: length(d_frame_fft_auieo)
%         if min_d > d_frame_fft_auieo(k)
%             min_d = d_frame_fft_auieo(k);
%             min_d_index = k;
%         end
%     end
    
    if min_d_index == 1
        check_a = check_a + 1;
    end
    if min_d_index == 2
        check_u = check_u + 1;
    end
    if min_d_index == 3
        check_i = check_i + 1;
    end
    if min_d_index == 4
        check_e = check_e + 1;
    end
    if min_d_index == 5
        check_o = check_o + 1;
    end
    
        
    
end

end

