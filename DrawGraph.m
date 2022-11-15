function [ index_frame ] = DrawGraph(fileNameWAV)
%     figure('Name', fileName);
    
    [y, Fs] = audioread(fileNameWAV); % doc du lieu tu file .wav
    y = y / max(abs(y)); % chuan hoa bien do ve [0;1]

    f_d = 0.025; % do dai cua moi frame la 25ms
    n = f_d * Fs;  % so luong mau trong moi frame
    
    T = 0.005; % dat nguong T
    
        frames = DivFrame(y, n); % chia tin hieu dau vao thanh cac frame
        [ste, ~] = STE(frames, n); % tim nang luong ngan han ste cua moi frame
        index_frame = SpeechSilences(ste, T, f_d); % vi tri cac frame speech/silences
%         [t, t_ste] = Time(y, Fs, ste_wave); % ham thoi gian t, ste theo chu ki lay mau 1/Fs
        
%         subplot(3,1,1); plot(t,y); title('Input'); ylabel('Bien do'); xlabel('Thoi gian(s)'); legend('Input signal');
        
%         subplot(3,1,2); plot(t,y); hold on; ylabel('Bien do'); xlabel('Thoi gian(s)'); title('Output speech/silences using standard segment');
        
%         subplot(3,1,3); 
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