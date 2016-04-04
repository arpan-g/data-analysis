clear all
Files=dir(fullfile('combined_data','*.mat')) ;
[num_files,index]=size(Files);
columm=1;
for file_counter = 1:num_files
    clearvars -except evaluation_matrix file_counter num_files Files counter columm row
    row=1;
    for time_period =36000:36000:23*36000;
        close all;
        clearvars -except newPirArray evaluation_matrix counter time_period file_counter num_files Files row columm 
        file = ['combined_data\',Files(file_counter).name];
        load(file);
        power_consumption
%         test
        verification_algo
%         clustering_kmean
        evaluation_matrix(row,columm)=te;
        row=row+1;
    end
    columm=columm+1;
end
% plot(evaluation_matrix(:,4))