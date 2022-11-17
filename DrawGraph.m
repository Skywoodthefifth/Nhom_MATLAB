function [ index_frame ] = DrawGraph(fileNameWAV)

    
    [y, Fs] = audioread(fileNameWAV); % doc du lieu tu file .wav
    y = y / max(abs(y)); % chuan hoa bien do ve [0;1]

    f_d = 0.02; % do dai cua moi frame la 20ms
    n = f_d * Fs;  % so luong mau trong moi frame
    
    T = 0.003; % dat nguong T
    
    frames = DivFrame(y, n); % chia tin hieu dau vao thanh cac frame
    [ste, ~] = STE(frames, n); % tim nang luong ngan han ste cua moi frame
    index_frame = SpeechSilences(ste, T, f_d); % vi tri cac frame speech/silences
        
%         figure('Name', fileName);
%         disp(index_frame);
%         [ste, ste_wave] = STE(frames, n);
%         [t, t_ste] = Time(y, Fs, ste_wave); % ham thoi gian t, ste theo chu ki lay mau 1/Fs
%             plot(t,y); hold on;
%             %do thi nang luong ngan han STE
%             plot(t_ste,ste_wave,'r','LineWidth',1.5); hold on;
%             y = [-1  1];
%             %ve cac duong bien khi su dung thuat toan
%             
%             for L= 1 : length(index_frame)
%                 line(index_frame(L)*ones(size(y)),y,'Color', 'b', 'LineWidth', 1.5);
%             end
%                     title('Ouput speech/silences using algorithm'); ylabel('Bien do'); xlabel('Thoi gian(s)'); legend('Input signal', 'STE');
end