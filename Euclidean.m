function [ d_frame_fft ] = Euclidean( frame_fft, vector_dactrung_THHL )
%EUCLIDEAN Ham tinh khoang cach Euclidean

%     d_frame_fft = norm(frame_fft - vector_dactrung_THHL); %Ham co san cua
%     MATLAB

%Ham tinh toan nhanh hon
V = frame_fft - vector_dactrung_THHL;
d_frame_fft = sqrt(V * V');

end

