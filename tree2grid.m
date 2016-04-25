%% tree to grid
clear all;

% [node_s,node_e]=random_trees;
% start_node=[101,101,103,103,105,105,107];
% end_node=[102,103,104,105,106,107,108];
num_rows=4;
num_cols=2;
n=num_rows*num_cols;
count = 1;
for i = 1:num_rows
    for j = 1:num_cols
        sensor_cordinates(count,:)=[i,j];
        count= count + 1;
    end
end


distance_measure=zeros(n);
for i = 1:n
    for j = 1:n
      distance_measure(i,j)=distance_euclidean(sensor_cordinates(i,:),sensor_cordinates(j,:));  
    end
end
power_consumption
for k=1:8
[node_s,node_e]=prims(distance_measure,k,n);

copy_r=R;len = length(node_s);
n=8;

for i = 1:8
    copy_r(i,i)=0;
end
count=1;
number_mapping=zeros(1,2);
% [a,b]=calculate_maximum(copy_r,2);
for i=1:len
    if(~isempty(intersect(number_mapping(:,1),node_s(i))))
        [r,c,v]= find(number_mapping==node_s(i));
        number_mapping(r,2)= number_mapping(r,2)+1;
        
    else
        number_mapping(count,1)=node_s(i);
        number_mapping(count,2)=1;
        count=count+1;
    end
end

[r_number_mapping,c_number_mapping]=size(number_mapping);
node_sensor_mapping=zeros(n,1);
tree_node=number_mapping(1,1);
prev_node=-1;
while(~isempty( tree_node))
    for  tree_node_iterator=tree_node
        [num_r,num_c,num_v]=find(number_mapping(:,1)==tree_node_iterator);
        if(isempty( num_r))
            % has no children
            num_leaf_nodes=0;
            node_to_delete=find(node_sensor_mapping==tree_node_iterator);
            copy_r(node_to_delete,:)=0;
            copy_r(:,node_to_delete)=0;
            continue;
        end
        num_leaf_nodes=number_mapping(num_r,2);
        
%         [corr_row,corr_col,corr_v]=find(number_mapping(:,1)==tree_node_iterator);
        [corr_row,corr_col,corr_v]=find(node_s==tree_node_iterator);
        [map_row,map_col,map_v]=find(node_sensor_mapping==tree_node_iterator);
        if(isempty(map_row))
            [a,b]=calculate_maximum(copy_r,num_leaf_nodes);
            node_sensor_mapping(a)=tree_node_iterator;
            map_row=a;
        else
            
            [values,indices]=sort(copy_r(map_row,:),'descend');
            b=indices(1:num_leaf_nodes);
            
        end
        copy_r(map_row,:)=0;
        copy_r(:,map_row)=0;
        
        count = 1;
        
        tmp_node=[];
        for b_iterator=b
            node_sensor_mapping(b_iterator)=node_e(corr_col(count));
            
            tmp_node=[tmp_node,node_e(corr_col(count))];
            count=count+1;
        end
        tree_node= tmp_node;
    end
    if(prev_node==tree_node_iterator)
        break
    end
    prev_node=tree_node_iterator;
    
    
end

placement(k,:)=node_sensor_mapping;
len=length(node_s);
sum_corr(k)=0;
for i = 1:len
    s=find(node_sensor_mapping==node_s(i));
    e=find(node_sensor_mapping==node_e(i));
    if(~(isempty(s)||isempty(e)))
    sum_corr(k)=sum_corr(k)+R(s,e);
    end
end
end










%
% copy_r(a,:)=0;
% for b_iterate = b
% copy_r(a,b_iterate)=0;
% copy_r(b_iterate,a)=0;
% end
%
%
%
% len = length(number_mapping(:,1));
% unique_set=[];
% for i = 1:len
%     if(isempty( intersect(unique_set,node_s(i))))
%     [r,c,v]=find(node_s,node_s(i));
%     edge_end_nodes=[];
%         for j = r
%             edge_end_nodes=[node_s(j),node_e(j)];
%         end
%         maximum_values(copy_r);
%
%         unique_set=[unique_set,node_s(i)];
%     end
%
%
%
% end



