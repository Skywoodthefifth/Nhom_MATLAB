function [ d_frame_fft ] = Euclidean( frame_fft, vector_dactrung_THHL )
%EUCLIDEAN Summary of this function goes here
%   Detailed explanation goes here
    d_frame_fft = norm(frame_fft - vector_dactrung_THHL);

end

