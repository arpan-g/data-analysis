%% Script to see the time-frequency variation of the data
% clc;clear all; close all;

% load('combine_data.mat');

[num_sensors, time_indices] = size(combine_data);

window_size = 128;
overlap_size = 64;

num_frames = (time_indices - (window_size - overlap_size))/overlap_size;
num_frames = round(num_frames);


time_freq_data = zeros(num_sensors,num_frames,window_size);
fft_data = zeros(num_sensors,num_frames,window_size);

for i = 1:num_sensors
%       i=1;
    for j = 1:num_frames
        for k = 1:window_size
            temp = k + ((window_size/2) * ((j-1) - 1));
            if(temp > 0)
                time_freq_data(i,j,k) = combine_data(i,temp);
            end
        end
        
    end    
end

for i = 1:num_sensors
    
   for j = 1:num_frames
        fft_data(i,j,:) = fft(time_freq_data(i,j,:));
        power_data(i,j,1) =  sum(fft_data(i,j,:) .* conj(fft_data(i,j,:)));
   end
end

%sens_fft_data = squeeze(fft_data(1,:,:));
sens_fft_data = squeeze(fft_data(1,:,:));
abs_value = abs(sens_fft_data);
plot(abs_value(4,:))

figure
imagesc(1:num_frames,1:128,abs(sens_fft_data'));
imagesc(power_data);
[corr,lag]=xcorr(combine_data(1,:),combine_data(3,:),'coeff');
[data,index]=max(corr)
lag(index)