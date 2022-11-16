close all;
clear;

folderName_THHL = ['01MDA', '02FVA', '03MAB', '04MHB', '05MVB', '06FTB', '07FTC', '08MLD', '09MPD', '10MSD','11MVD','12FTD','14FHH', '15MMH','16FTH','17MTH','18MNK', '19MXK', '20MVK', '21MTL', '22MHL'];
folderName_THKT = ['23MTL', '24FTL', '25MLM', '27MCM', '28MVN', '29MHN', '30FTN', '32MTP', '33MHP', '34MQP','35MMQ','36MAQ','37MDS', '38MDS','39MTS','40MHS','41MVS', '42FQT', '43MNT', '44MTT', '45MDV'];
            
            
vector_dactrung_a_THHL = VectorDacTrung(folderName_THHL, 'a.wav');
vector_dactrung_u_THHL = VectorDacTrung(folderName_THHL, 'u.wav');
vector_dactrung_i_THHL = VectorDacTrung(folderName_THHL, 'i.wav');
vector_dactrung_e_THHL = VectorDacTrung(folderName_THHL, 'e.wav');
vector_dactrung_o_THHL = VectorDacTrung(folderName_THHL, 'o.wav');




for i=1:21

    
    tenthumuc=folderName((i-1)*5+1:5*i);
    audioName = ['THHL\' tenthumuc '\'  fileName];
    
    [y, Fs] = audioread(audioName); % doc du lieu tu file .wav
    y = y / max(abs(y)); % chuan hoa bien do ve [0;1]
    
    index_frame = DrawGraph(audioName);
    
    t = [0 : 1 / Fs : length(y) / Fs];
    t = t(1 : end - 1);

    
            
            
    N_start=index_frame(1);
    N_end=index_frame(length(index_frame));

    khoangchia=(N_end-N_start)/3;

            

    khung_frame = y( Fs * (N_start+khoangchia) : Fs * (N_start+2*khoangchia) );


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
    
end




