%% run all
clear all;
Files=dir(fullfile('long_tests\pir_data','*.mat')) ;
[num_files,index]=size(Files);
% file_counter=10;
% for window_size = 10:2:64;
count_snip=1;
    for file_counter = 1: num_files
        close all;
        clear time_*;
        clear pir_array;
        clear corr_file;
        clear map_file
        file = ['long_tests\pir_data\',Files(file_counter).name];
        %     ver_file='ver.png';
        %     power_file='19_02_pow.png';
        %     corr_file = 'test_corr_file.png';
        %     map_file = 'test_map.png';
        %     pir_array_file=['07_03/','pir_',Files(file_counter).name(1:end-4),'.mat'];
        %     ver_file=['07_03/',Files(file_counter).name(1:end-4),'_ver.png'];
        %     power_file=['07_03/',Files(file_counter).name(1:end-4),'_power.png'];
        %     corr_file = ['07_03/',Files(file_counter).name(1:end-4),'_corr.png'];
        %     map_file  = ['07_03/',Files(file_counter).name(1:end-4),'_map.png'];
        % file = '16_02_lunch.mat';
        % pir_array_file=['07_03/','pir_16_02_lunch.mat'];
%         time_analysis_Short       
%         test_sample
        power_consumption
        verification_algo
        evaluation_matrix(file_counter,:)=[bestThreshold,falseNegative,falsepositive];
        snippet
    end
    
% end
