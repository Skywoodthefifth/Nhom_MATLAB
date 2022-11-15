function [t, t_STE] = Time(y, Fs, ste_wave) % ham thoi gian t, ste theo chu ki lay mau 1/Fs
        t = [0 : 1 / Fs : length(y) / Fs];
        t = t(1 : end - 1);
        t_STE = [0 : 1 / Fs : length(ste_wave) / Fs];
        t_STE = t_STE(1 : end - 1);
end