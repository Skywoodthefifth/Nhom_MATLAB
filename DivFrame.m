function frames = DivFrame(y, n) % chia tin hieu dau vao thanh cac frame
    n = round(n);
    l_s = length(y);
    n_f = floor(l_s/n);
    temp = 0;
    for i = 1 : n_f 
        frames(i,:) = y(temp + 1 : temp + n); 
        temp = temp + n;
    end
end