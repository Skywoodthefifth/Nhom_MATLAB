function [index_frame] =  SpeechSilences(ste, T, f_d) % phan biet cac frame speech/silences
    id_frame = find(ste > T);   % vi tri frame co ste > T (ste >T: speech, ste <T: silence)
    index_frame = id_frame(1) - 1; 
    for i = 1 : length(id_frame)
        if (i+1 <= length(id_frame))
            if ( f_d*( id_frame(i+1) - id_frame(i) ) >= 0.3) % xac dinh frame silences 'that su'
                index_frame(end + 1) = id_frame(i);
            end
        else
            index_frame(end + 1) = id_frame(i) + 1;
        end
        
    end
    
    index_frame = f_d*index_frame;
end