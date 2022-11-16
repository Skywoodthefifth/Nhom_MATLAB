close all;
clear;

folderName_THHL = ['01MDA', '02FVA', '03MAB', '04MHB', '05MVB', '06FTB', '07FTC', '08MLD', '09MPD', '10MSD','11MVD','12FTD','14FHH', '15MMH','16FTH','17MTH','18MNK', '19MXK', '20MVK', '21MTL', '22MHL'];
folderName_THKT = ['23MTL', '24FTL', '25MLM', '27MCM', '28MVN', '29MHN', '30FTN', '32MTP', '33MHP', '34MQP','35MMQ','36MAQ','37MDS', '38MDS','39MTS','40MHS','41MVS', '42FQT', '43MNT', '44MTT', '45MDV'];
 
fileLength = 21;
            
vector_dactrung_a_THHL = VectorDacTrung(folderName_THHL, 'a.wav', fileLength);
vector_dactrung_u_THHL = VectorDacTrung(folderName_THHL, 'u.wav', fileLength);
vector_dactrung_i_THHL = VectorDacTrung(folderName_THHL, 'i.wav', fileLength);
vector_dactrung_e_THHL = VectorDacTrung(folderName_THHL, 'e.wav', fileLength);
vector_dactrung_o_THHL = VectorDacTrung(folderName_THHL, 'o.wav', fileLength);

check_a =0;
check_u =0;
check_i =0;
check_e =0;
check_o =0;


for i=1:21

    
    tenthumuc=folderName_THKT((i-1)*5+1:5*i);
    audioName = ['THKT\' tenthumuc '\'  'a.wav'];
    
    [y, Fs] = audioread(audioName); % doc du lieu tu file .wav
    y = y / max(abs(y)); % chuan hoa bien do ve [0;1]
    
    index_frame = DrawGraph(audioName);
    
    t = [0 : 1 / Fs : length(y) / Fs];
    t = t(1 : end - 1);

    
            
            
    N_start=index_frame(1);
    N_end=index_frame(length(index_frame));

    khoangchia=(N_end-N_start)/3;

        khung_frame_start = round(Fs * (N_start+khoangchia));
        khung_frame_end = round(Fs * (N_start+2*khoangchia));

    khung_frame = y( khung_frame_start : khung_frame_end );


    f_d = 0.020; % do dai cua moi frame la 25ms
    n = f_d * Fs;  % so luong mau trong moi frame

    frames = DivFrame(khung_frame, n);



    frame_fft = zeros(1, 512); %N_FFT

    for j = 1: size(frames,1)
        temp_frame = frames(j, : );

        frame_fft = frame_fft + fft(temp_frame, 512); %N_FFT
    end

    %vector dac trung 
    frame_fft = frame_fft./size(frames,1);
    
    d_frame_fft_auieo = zeros(1, 5);
    
    d_frame_fft_auieo(1) = Euclidean(frame_fft, vector_dactrung_a_THHL);
    d_frame_fft_auieo(2) = Euclidean(frame_fft, vector_dactrung_u_THHL);
    d_frame_fft_auieo(3) = Euclidean(frame_fft, vector_dactrung_i_THHL);
    d_frame_fft_auieo(4) = Euclidean(frame_fft, vector_dactrung_e_THHL);
    d_frame_fft_auieo(5) = Euclidean(frame_fft, vector_dactrung_o_THHL);
    
    [max_d ,max_d_index] = max(d_frame_fft_auieo);
%     max_d_index = 0;
    for k = 1: length(d_frame_fft_auieo)
        if max_d > d_frame_fft_auieo(k)
            max_d = d_frame_fft_auieo(k);
            max_d_index = k;
        end
    end
    
    if max_d_index == 1
        check_a = check_a + 1;
    end
    if max_d_index == 2
        check_u = check_u + 1;
    end
    if max_d_index == 3
        check_i = check_i + 1;
    end
    if max_d_index == 4
        check_e = check_e + 1;
    end
    if max_d_index == 5
        check_o = check_o + 1;
    end
    
        
    
end




