%% run all
clear all;
Files=dir(fullfile('long_tests\pir_data','*.mat')) ;
[num_files,index]=size(Files);
% for file_counter = 1: num_files
    close all;
    clear time_*;
    clear pir_array;
    clear corr_file;
    clear map_file
%         file = ['long_tests\pir_data\',Files(file_counter).name];
    file = '19_02_exp.mat';
    time_analysis_Short
    test_sample
    power_file='19_02_pow.png'
        corr_file = 'test_corr_file.png';
        map_file = 'test_map.png';
%     power_file=['07_03/',Files(file_counter).name(1:end-4),'_power.png'];
%     corr_file = ['07_03/',Files(file_counter).name(1:end-4),'_corr.png'];
%     map_file  = ['07_03/',Files(file_counter).name(1:end-4),'_map.png'];
    power_consumption
% end