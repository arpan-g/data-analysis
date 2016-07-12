%% run all
clear all;


window_count = 1;

% folder_name='C:\arpan\Thesis\data_analysis\data-analysis\WSU\';
folder_name='C:\arpan\Thesis\data_analysis\data-analysis\temp\';
% folder_name='join_data\';
% folder_name='long_tests\pir_data\';

Files=dir(fullfile(folder_name,'*.mat')) ;


[num_files,index]=size(Files);





diagonal_count=1;mega_number=1;
% for go_again = 1:11
for file_counter = 1:num_files
    count_window=1;
    %     for window_size = 10:2:64
    close all;
    clear time_*;
    clear pir_array;
    clear corr_file;
    clear newPirArray;
    clear dataArray;
    clear node*;
    clear c*;
    %
    %         file='15_03.mat';
    file = [folder_name,Files(file_counter).name];
    %     file=[folder_name,'06_07_0_ppl.report'];
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
    %     file_counter=4;
%     value=7;
%     name= Files(file_counter).name(1:end-4);
        ppl=[folder_name,'pir_',Files(file_counter).name(1:end-4),'.mat'];
    %     energy=[folder_name,Files(file_counter).name(1:end-4),'_energy','.png'];
%     analog=[folder_name,Files(file_counter).name(1:end-7),'_rssi','.png'];
    %     heatMap=[folder_name,Files(file_counter).name(1:end-6),'_heatMap_light','.png'];
    %     ver_file=[folder_name,'ver_',Files(file_counter).name(1:end-4),'.png'];
    %     power_file=[folder_name,'power_',Files(file_counter).name(1:end-4),'.png'];
    %         corr_file = [folder_name,Files(file_counter).name(1:end-4),'_corr.png'];
    %     map_file  = [folder_name,Files(file_counter).name(1:end-4),'_map.png'];
    % file = '16_02_lunch.mat';
    %         pir_array_file=['07_03/','pir_15_03.mat'];
    %                     time_analysis_Short
    %                     test_sample
    %     power_consumption
    %     clustering_kmean
    %     grid_cordinates
    %         max_spamming_tree_euclidean
    %             tree2grid
    
    %     brute_force
    %     clustering_kmean
    %     raw_signal_analysis
    %     wrenNRao
    %         verification_algo
    %             assign_diagonal
    %     stat
    %     test
                combine_data
    % bar_plot
    %         isomorphicTreeMatching
    %     brute_force
    %     ppt
%     time_analysis_Short
%     test_sample
    
    
%     memsic_analysis
%     plot_memsic
    
    %         evaluation_matrix(file_counter,count_window)=error;
    %         count_window=count_window+1;
end
% end
% end
% clear newPirArray;
% newPirArray=data_combine;
% save('txt_files\ai_lab\ai_lab_grid_43_58n83_reduce.mat','newPirArray')
