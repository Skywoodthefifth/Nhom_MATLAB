function [ ] = Spectrogram( folderName, fileFolderLength, fileName )
    

    for i=1:fileFolderLength
        individual_folderName=folderName((i-1)*5+1:5*i);
        audioName = ['THHL\' individual_folderName '\'  fileName];
        [y, fs] = audioread(audioName);
        t = 0:1/fs:length(y)/fs- 1/fs;
        % Window length of 5 msec and step of 3 msec
        str = sprintf('Spectrogram %s', fileName);
        figure; 
        title(str);
        subplot(211); 
        plot(t, y); 
        xlabel('Time (s)'); 
        subplot(212);
        spectrogram(y, 5*10^(-3)*fs, 2*10^(-3)*fs, 1024, fs, 'yaxis'); 
        
    
    end
    
    
end