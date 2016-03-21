%% run all
clear all;
window_count = 1;
% for window_size =10:2:128;
window_size=36;
clearvars -except window_size min_threshold window_count best_window;

Files=dir(fullfile('long_tests\pir_data','*.mat')) ;
% Files=dir(fullfile('march_data','*.mat')) ;

folder_name='images/';
[num_files,index]=size(Files);
% min_threshold(window_count,:)=[window_size,-1,1,1];

% file_counter=10;

% count_snip=1;
%     weka_file=[folder_name,'overlaping','.arff'];
%     fileID = fopen(weka_file,'w');
%     fprintf(fileID,'@relation ''correlation-neig-non-neighbors''\n');
%     fprintf(fileID,'@attribute ''correlation'' numeric\n');
%     fprintf(fileID,'@attribute ''activity'' {''1'',''0'',''-1''}\n');
%     fprintf(fileID,'@data\n');
diagonal_count=1;mega_number=1;
for file_counter = 1: num_files
    close all;
    clear time_*;
    clear pir_array;
    clear corr_file;
    clear map_file
    %         file='15_03.mat';
    file = ['long_tests\pir_data\',Files(file_counter).name];
    
%     scatter_plot=[folder_name,'scatter_',Files(file_counter).name(1:end-4),'_1.png'];
    ver_file=[folder_name,'ver_',Files(file_counter).name(1:end-4),'.png'];
%     power_file=[folder_name,'power_',Files(file_counter).name(1:end-4),'.png'];
%     corr_file = [folder_name,Files(file_counter).name(1:end-4),'_corr.png'];
%     map_file  = [folder_name,Files(file_counter).name(1:end-4),'_map.png'];
    % file = '16_02_lunch.mat';
    %         pir_array_file=['07_03/','pir_15_03.mat'];
    %     time_analysis_Short
    %     test_sample
%     power_consumption
% %     raw_signal_analysis
%     verification_algo
%     stat
%     test
    combine_data
%     evaluation_matrix(file_counter,:)=[bestThreshold,mn,sd,dist];
 
% break;
end
% snippet
%    best_window(window_count,:)=[window_size,min_one,max_zero];
window_count = window_count+1;

%     fclose(fileID);

% end