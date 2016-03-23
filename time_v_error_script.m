clear all
Files=dir(fullfile('combined_data','*.mat')) ;
[num_files,index]=size(Files);
counter=1;
for file_counter = 1:num_files
    clearvars -except evaluation_matrix file_counter num_files Files counter
    
    for time_period =36000:36000:2007539
        close all;
        clearvars -except newPirArray evaluation_matrix counter time_period file_counter num_files Files counter
        file = ['combined_data\',Files(file_counter).name];
        load(file);
        power_consumption
        test
        % verification_algo
        % clustering_kmean
        % evaluation_matrix(counter,:)=[file_counter,time_period,falseNegative,falsepositive,falseNegative/16+falsepositive/12];
        counter=counter+1;
    end
end
% plot(evaluation_matrix(:,4))