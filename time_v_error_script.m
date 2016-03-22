clear all
counter=1;
for time_period =36000:36000:2007539
clearvars -except newPirArray evaluation_matrix counter time_period
load('combined_data\combi_10.mat');
power_consumption
clustering_kmean
evaluation_matrix(counter,:)=[time_period,falseNegative,falsepositive,falseNegative/16+falsepositive/12];
counter=counter+1;
end
plot(evaluation_matrix(:,4))