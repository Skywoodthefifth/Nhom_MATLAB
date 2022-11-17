function [ste, ste_wave] = STE(frames, n) % tim nang luong ngan han STE cua moi frame
    [r,~] = size(frames);

    ste = 0;
    for i = 1 : r 
        ste(i) = sum(frames(i,:).^2);    
    end
    ste = ste./max(ste); % chuan hoa ste ve [0;1]

    ste_wave = 0; % nang luong cua tung mau trong moi frame
    for j = 1 : length(ste)
        l = length(ste_wave);
        ste_wave(l : l + n) = ste(j);
    end

end