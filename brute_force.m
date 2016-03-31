
%% brute force method
clear all;
t = cputime;
v=[1,2,3,4,5,6,7,8];
Files=dir(fullfile('combined_data','*.mat')) ;
file = 'long_tests\pir_data\pir01_03.mat';
load(file);
masters=perms(v);
optimistic_neighbouring_map=[ 1     1     1     -1     0     0     0     0;    1     1     -1     1     0     0     0     0;    1     -1     1     1     1     -1     0     0;    -1     1     1     1     -1     1     0     0;    0     0     1     -1     1     1     1     -1;    0     0     -1     1     1     1     -1     1;    0     0     0     0     1     -1     1     1;    0     0     0     0     -1     1     1     1];
optimistic_neighbouring_map=abs(optimistic_neighbouring_map);NO_ONES=16;
neighbouring_map=optimistic_neighbouring_map;
% masters=[8 1 7 2 6 3 5 4];
combine_data = newPirArray;
power_consumption;
for perm_count =1:40320
    %     combine_data=[newPirArray(masters(perm_count,1),:);newPirArray(masters(perm_count,2),:);newPirArray(masters(perm_count,3),:);...
    %         newPirArray(masters(perm_count,4),:);newPirArray(masters(perm_count,5),:);newPirArray(masters(perm_count,6),:);...
    %         newPirArray(masters(perm_count,7),:);newPirArray(masters(perm_count,8),:)];
    
    %         test
    %     verification_algo
    sum_k=R(masters(perm_count,1),masters(perm_count,2))+R(masters(perm_count,1),masters(perm_count,3))+R(masters(perm_count,1),masters(perm_count,4))+...
        R(masters(perm_count,2),masters(perm_count,4))+R(masters(perm_count,2),masters(perm_count,3))+R(masters(perm_count,3),masters(perm_count,5))+...
        R(masters(perm_count,3),masters(perm_count,6))+R(masters(perm_count,3),masters(perm_count,4))+...
        R(masters(perm_count,4),masters(perm_count,6))+R(masters(perm_count,4),masters(perm_count,5))+R(masters(perm_count,5),masters(perm_count,6))+...
        R(masters(perm_count,5),masters(perm_count,7))+R(masters(perm_count,5),masters(perm_count,8))+R(masters(perm_count,6),masters(perm_count,8))+...
        R(masters(perm_count,6),masters(perm_count,7))+R(masters(perm_count,7),masters(perm_count,8));
    
    
    
    
    evaluation_matrix(perm_count)=sum_k;
end
maximum_sum=max(evaluation_matrix);
[corr_row,corr_colum,v] = find(evaluation_matrix==maximum_sum);

total_time=cputime-t;
count=1;

for perm_count = corr_colum
    adjacency_matrix=zeros(8,8);
    adjacency_matrix(masters(perm_count,1),masters(perm_count,2))=1;
    adjacency_matrix(masters(perm_count,1),masters(perm_count,3))=1;
    adjacency_matrix(masters(perm_count,1),masters(perm_count,4))=1;
    adjacency_matrix(masters(perm_count,2),masters(perm_count,4))=1;
    adjacency_matrix(masters(perm_count,2),masters(perm_count,3))=1;
    adjacency_matrix(masters(perm_count,3),masters(perm_count,5))=1;
    adjacency_matrix(masters(perm_count,3),masters(perm_count,6))=1;
    adjacency_matrix(masters(perm_count,3),masters(perm_count,4))=1;
    adjacency_matrix(masters(perm_count,4),masters(perm_count,6))=1;
    adjacency_matrix(masters(perm_count,4),masters(perm_count,5))=1;
    adjacency_matrix(masters(perm_count,5),masters(perm_count,6))=1;
    adjacency_matrix(masters(perm_count,5),masters(perm_count,7))=1;
    adjacency_matrix(masters(perm_count,5),masters(perm_count,8))=1;
    adjacency_matrix(masters(perm_count,6),masters(perm_count,8))=1;
    adjacency_matrix(masters(perm_count,6),masters(perm_count,7))=1;
    adjacency_matrix(masters(perm_count,7),masters(perm_count,8))=1;
    adjacency_matrix=adjacency_matrix+adjacency_matrix';
    
    falsepositive=0;
for i= 1:8
    for j = i+1:8
        if(optimistic_neighbouring_map(i,j)==0)
            if( optimistic_neighbouring_map(i,j)~=   adjacency_matrix(i,j));
                fpMatrix(falsepositive+1,1)=i;
                fpMatrix(falsepositive+1,2)=j;
                falsepositive=falsepositive+1;
                
            end
        end
    end
end
falseNegative=0;
for i= 1:8
    for j = i+1:8
        if(optimistic_neighbouring_map(i,j)==1)
            if( optimistic_neighbouring_map(i,j)~=   adjacency_matrix(i,j));
                fnMatrix(count,1)=i;
                fnMatrix(count,2)=j;
                falseNegative=falseNegative+1;
                
            end
        end
    end
end
te=falseNegative/NO_ONES+falsepositive/12;
error_matrix(count)=te;
    count=count+1;
end
