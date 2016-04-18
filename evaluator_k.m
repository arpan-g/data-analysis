
clear all;
folder_name='combined_data\';
Files=dir(fullfile(folder_name,'*.mat')) ;
kimi=1;
time_period=  1296000;
[num_files,index]=size(Files);
for k =1:5
for file_counter = 1:num_files
    
        file = [folder_name,Files(file_counter).name];
        load(file);
        k_nearest_neighbors
        evaluation_matrix(kimi,:)=[file_counter,k,total_error,total_error/8*100];
        kimi = kimi + 1;
    end
end