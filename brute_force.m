
%% brute force method
clear all;
t = cputime;
v=[1,2,3,4,5,6,7,8];
Files=dir(fullfile('combined_data','*.mat')) ;
 file = ['combined_data\',Files(1).name];
 load(file);
masters=perms(v);
for perm_count =1:40320
    combine_data=[newPirArray(masters(perm_count,1),:);newPirArray(masters(perm_count,2),:);newPirArray(masters(perm_count,3),:);...
        newPirArray(masters(perm_count,4),:);newPirArray(masters(perm_count,5),:);newPirArray(masters(perm_count,6),:);...
        newPirArray(masters(perm_count,7),:);newPirArray(masters(perm_count,8),:)];
    power_consumption;
    %         test
%     verification_algo
sum_k=0;
for s_k = 1:8
    for j_k = s_k+1:8
        sum_k = sum_k+R(s_k,j_k);
    end
end
evaluation_matrix(perm_count)=sum_k;
end
total_time=cputime-t;
