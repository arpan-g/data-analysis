%% run all
clear all;
% for runs=1:20

window_count = 1;
% for window_size =10:2:128;
% window_size=36;
% clearvars -except window_size min_threshold window_count best_window;
% Files=dir(fullfile('join_data','*.mat')) ;
% folder_name='combined_data\';
folder_name='long_tests\pir_data\';
% folder_name='join_data\';
% folder_name='ashish_data\';
Files=dir(fullfile(folder_name,'*.mat')) ;
% Files=dir(fullfile('ashish_data','*.mat')) ;
% Files=dir(fullfile('ashish_data','*.mat')) ;
total_c=0;
% folder_name='images/';
[num_files,index]=size(Files);
% min_threshold(window_count,:)=[window_size,-1,1,1];

% file_counter=10;
% folder_name='ashish_data/';
% count_snip=1;
%     weka_file=[folder_name,'overlaping','.arff'];
%     fileID = fopen(weka_file,'w');
%     fprintf(fileID,'@relation ''correlation-neig-non-neighbors''\n');
%     fprintf(fileID,'@attribute ''correlation'' numeric\n');
%     fprintf(fileID,'@attribute ''activity'' {''1'',''0'',''-1''}\n');
%     fprintf(fileID,'@data\n');
% randperm(12)
% file = 'pir_eight_seven.mat';
diagonal_count=1;mega_number=1;
for file_counter = 1:num_files
    close all;
    clear time_*;
    clear pir_array;
    clear corr_file;
    clear newPirArray;
    clear dataArray;
    %
    %         file='15_03.mat';
    file = [folder_name,Files(file_counter).name];
    load(file);
    %     [r,c]=size(newPirArray);
    %     total_c=total_c+c;
    %    matrix= calculate_last_trigger(newPirArray);
    %     if(sum(matrix)==1)
    %        [val,index]= max(matrix);
    %     else
    %         index=-1;
    %     end
    %
    
    %             ppl=[folder_name,'pir_',Files(file_counter).name(1:end-4),'.mat'];
    %     ver_file=[folder_name,'ver_',Files(file_counter).name(1:end-4),'.png'];
    %     power_file=[folder_name,'power_',Files(file_counter).name(1:end-4),'.png'];
    %         corr_file = [folder_name,Files(file_counter).name(1:end-4),'_corr.png'];
    %     map_file  = [folder_name,Files(file_counter).name(1:end-4),'_map.png'];
    % file = '16_02_lunch.mat';
    %         pir_array_file=['07_03/','pir_15_03.mat'];
    %             time_analysis_Short
    %             test_sample
    power_consumption
    clustering_kmean
    grid_cordinates
    %         max_spamming_tree_euclidean
%             tree2grid
    
%     brute_force
    %     clustering_kmean
    %     raw_signal_analysis
    %     verification_algo
    %             assign_diagonal
    %     stat
    %     test
    %     combine_data
    
    
    evaluation_matrix(file_counter,:)=error;
%     index_matrix(file_counter,:)=arrangement;
    %     new_adjacency_matrix
    
    % break;
    
end
% end
% clear newPirArray;
% newPirArray=data_combine;
% save('huge_data.mat','newPirArray');
% clearvars -except data_combine
% newPirArray = data_combine;
% save('combi_10.mat','newPirArray');
% snippet
%    best_window(window_count,:)=[window_size,min_one,max_zero];
% window_count = window_count+1;

%     fclose(fileID);

% end