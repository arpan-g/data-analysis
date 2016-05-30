%% run all
clear all;


window_count = 1;

folder_name='join_data\';
% folder_name='combined_data\';

Files=dir(fullfile(folder_name,'*.mat')) ;


[num_files,index]=size(Files);





diagonal_count=1;mega_number=1;
% for go_again = 1:11
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
    %     load(file);
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
    %     power_consumption
    %     clustering_kmean
    %     grid_cordinates
    %         max_spamming_tree_euclidean
    %             tree2grid
    
    %     brute_force
    %     clustering_kmean
    %     raw_signal_analysis
    %     verification_algo
    %             assign_diagonal
    %     stat
    %     test
            combine_data
%         isomorphicTreeMatching
%     brute_force
    
%     evaluation_matrix(file_counter,go_again)=error;
    
    
end
% end
clear newPirArray;
newPirArray=data_combine;
save('txt_files\ai_lab\ai_lab_grid_43_combine.mat','newPirArray')
