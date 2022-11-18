function [ check_a, check_u, check_i, check_e, check_o ] = SoSanhVectorDacTrung( folderName_THKT, fileName, fileFolderLength, vector_dactrung_a_THHL, vector_dactrung_u_THHL, vector_dactrung_i_THHL, vector_dactrung_e_THHL, vector_dactrung_o_THHL )
%SOSANHVECTORDACTRUNG Nhan dang nguyen am, su dung vector dac trung da dc
%huan luyen
%   Ta se doc cac file tu folder THKT, tung nguyen am, trich xuat vector
%   FFT dac trung cua tung file va Tinh khoang cach Euclidean cua vector
%   dac trung cua tung file so voi 5 vector dac trung da duoc huan luyen
%   , tu do nhan dang nguyen am bang khoang cach nho nhat

N_FFT = 1024; % Khuong mau do dai vector FFT, thuong co gia tri 512 , 1024, 2048 
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
    
    %Phan tich tieng noi khoang lang
    index_frame = DrawGraph(audioName);
           
    N_start=index_frame(1);
    N_end=index_frame(length(index_frame));

    %chia khoang tieng noi thanh 3 phan bang nhau va lay phan giua
    khoangchia=(N_end-N_start)/3;

    khung_frame_start = round(Fs * (N_start+khoangchia));
    khung_frame_end = round(Fs * (N_start+2*khoangchia));

    khung_frame = y( khung_frame_start : khung_frame_end );

    f_d = 0.020; % do dai cua moi frame
    n = f_d * Fs;  % so luong mau trong moi frame

    %tach khung chia tren thanh cac frame
    frames = DivFrame(khung_frame, n);


    frame_fft = zeros(1, N_FFT); 

    for j = 1: size(frames,1)
        temp_frame = frames(j, : );
        X1 = abs(fft(temp_frame, N_FFT))./length(temp_frame);%X1 tra ve vector chua cac complex num
        frame_fft = frame_fft + X1; 
    end

    %vector dac trung 
    frame_fft = frame_fft./size(frames,1);
    
    %Tinh khoang cach Euclidean voi 5 vector Huan Luyen
    d_frame_fft_auieo = zeros(1, 5);
    
    d_frame_fft_auieo(1) = Euclidean(frame_fft, vector_dactrung_a_THHL);
    d_frame_fft_auieo(2) = Euclidean(frame_fft, vector_dactrung_u_THHL);
    d_frame_fft_auieo(3) = Euclidean(frame_fft, vector_dactrung_i_THHL);
    d_frame_fft_auieo(4) = Euclidean(frame_fft, vector_dactrung_e_THHL);
    d_frame_fft_auieo(5) = Euclidean(frame_fft, vector_dactrung_o_THHL);
    
    %xac dinh khoang cach nho nhat
    [~ ,min_d_index] = min(d_frame_fft_auieo);
    
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

