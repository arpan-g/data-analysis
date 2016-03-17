
%% run all
clear all;
window_count = 1;
% for window_size =10:2:128;
window_size=48;
clearvars -except window_size min_threshold window_count;

Files=dir(fullfile('long_tests\pir_data','*.mat')) ;
folder_name='21_03/';
[num_files,index]=size(Files);
min_threshold(window_count,:)=[window_size,-1,1,1];

% file_counter=10;

    % count_snip=1;
    weka_file=[folder_name,'overlaping','.arff'];
    fileID = fopen(weka_file,'w');
    fprintf(fileID,'@relation ''correlation-neig-non-neighbors''\n');
    fprintf(fileID,'@attribute ''correlation'' numeric\n');
    fprintf(fileID,'@attribute ''activity'' {''1'',''0'',''-1''}\n');
    fprintf(fileID,'@data\n');
    diagonal_count=1;
    for file_counter = 1: num_files
        close all;
        clear time_*;
        clear pir_array;
        clear corr_file;
        clear map_file
        %         file='15_03.mat';
        file = ['long_tests\pir_data\',Files(file_counter).name];
        %     ver_file='ver.png';
        %     power_file='19_02_pow.png';
        %     corr_file = 'test_corr_file.png';
        %     map_file = 'test_map.png';
        %     pir_array_file=['07_03/','pir_',Files(file_counter).name(1:end-4),'.mat'];
        
            ver_file=[folder_name,Files(file_counter).name(1:end-4),'_ver.png'];
            power_file=[folder_name,Files(file_counter).name(1:end-4),'_power.png'];
            corr_file = [folder_name,Files(file_counter).name(1:end-4),'_corr.png'];
            map_file  = [folder_name,Files(file_counter).name(1:end-4),'_map.png'];
        % file = '16_02_lunch.mat';
        %         pir_array_file=['07_03/','pir_15_03.mat'];
        %     time_analysis_Short
        %     test_sample
        power_consumption
        verification_algo
        
       
        evaluation_matrix(file_counter,:)=[bestThreshold,falseNegative,falsepositive];
        
    end
     snippet
    window_count = window_count+1;
    fclose(fileID);
    
% end
