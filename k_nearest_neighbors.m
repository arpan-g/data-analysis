%% work with large datasets
% clear all;
total_error=0;
clc;close all;
clear energyMatrix;
clear filteredMatrix;
clear neighbor_matrix;
clear R;
clear actual_neighbor_matrix;
n=8;
% k = 1;
diff=zeros(n,k);
error=zeros(1,n);


window_size = 36;
overlap_size = window_size/2;
% file = 'join_data/324001.mat';
load(file);
combine_data=newPirArray(:,1:time_period);
len=size(combine_data);
for i = 1:n
    count =1;
    for k_overlap = 1:overlap_size:len(2)
        if(k_overlap+window_size<len(2))
            values=combine_data(i,k_overlap:k_overlap+window_size-1);
            energyMatrix(i,count)= sum(values);
            count = count +1;
        end
    end
end
R=correlation_pearson(transpose(energyMatrix));
for i = 1:n
    R(i,i)=0;
end

for i = 1:n
    [values,indices]=sort(R(i,:),'descend');
    neighbor_matrix(i,:)=indices(1:k);
end

% error calculation
count = 1;
r=4;c=2;
for i = 1:r
    for j = 1:c
        cartesian_matrix(count,:)=[i,j];
        count = count+1;
    end
end

for i= 1:n
    for j = 1:n
        
%         distance(i,j)=sqrt((cartesian_matrix(i,1)-cartesian_matrix(j,1))^2+(cartesian_matrix(i,2)-cartesian_matrix(j,2))^2);
       distance(i,j) =distance_euclidean(cartesian_matrix(i,:),cartesian_matrix(j,:));
%        distance(i,j) =distance_custom(cartesian_matrix(i,:),cartesian_matrix(j,:));
        
    end
    %     [v,max_distance_node(i)]=max(distance(i,:));
    distance(i,i)=n;
end

for i = 1:n
    [values,indices]=sort(distance(i,:));
    actual_neighbor_matrix(i,:)=indices(1:k);
    border_node(i)=values(k);
    max_node(i)=values(n-1);
    
end

for i = 1:n
    for j = 1:k
        a=distance_euclidean(cartesian_matrix(neighbor_matrix(i,j),:),cartesian_matrix(i,:));
        if(a>border_node(i))
            error(i)=error(i)+(a-border_node(i));
        end
    end
    error(i)=error(i)/(k*(border_node(i)));
    total_error=error(i)+total_error;
    total_error=total_error;
    
end

% for i = 1:n
%     for j = 1:k
%         if(diff(i,j)~=0)
%             error(i)=error(i)+cartesian_matrix(diff(i,j),:)
%         end
%     end
%
% end





