function [ energy ] = calc_energy( data )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
[r,c]=size(data);

fftd = fft(data);
enrgy_array = fftd.*conj(fftd);
energy = sum(enrgy_array);


end

