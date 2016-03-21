clear all
counter=1;
for time_period =36000:12000:432000
clearvars -except newPirArray evaluation_matrix counter time_period
load('all_data.mat');
power_consumption
verification_algo
evaluation_matrix(counter,:)=[time_period,falseNegative,falsepositive,falseNegative/NO_ONES+falsepositive/12];
counter=counter+1;
end