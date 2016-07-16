clear all;
load('master_data_wsu_4x3_fil.mat')
[r,c]=size(newPirArray);
k=600*10;
count =1;
for i = 1:k:c-k
    start_time=i;
    end_time=i+k;
    temp=newPirArray(:,start_time:end_time);
    sum_temp=sum(temp(12,:));
    if(sum_temp>=k)
        evaluation_matrix(count)=i;
        count = count + 1;
    end
    
    
end
count = count -1;
[s_r,s_c]=size(evaluation_matrix);
for i = 1:s_c
    newPirArray(:,evaluation_matrix(count):evaluation_matrix(count)+k)=[];
    count =count -1;
end
save('master_data_wsu_4x3_fil.mat','newPirArray')
