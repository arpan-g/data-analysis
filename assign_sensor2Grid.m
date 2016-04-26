function[grid_map,sensor_map]=assign_sensor2Grid(sensor_node_visited,number_mapping,grid_indices,sensor_indicies,r)
numLeafMatrix=[];
sensor_map=[];
grid_map=[];
len=length(grid_indices);
for i = grid_indices
    [num_r,num_c,num_v]=find(number_mapping(:,1)==i);
    if(isempty( num_r))
        % has no children
        num_leaf_nodes=0;
    else
        num_leaf_nodes=number_mapping(num_r,2);
    end
    numLeafMatrix=[numLeafMatrix,num_leaf_nodes];
end
[val,index]=sort(numLeafMatrix,'descend');
sum_r=zeros(len,1);
count=1;
for i = index
    [val_r,index_r]=sort(r(sensor_indicies(i),:),'descend');
    num=val(i);
    
    kimi=1;
    for j = 1:8
        if(sensor_node_visited(index_r(j))==0)
            sum_r(count)=sum_r(count)+val_r(j);
            kimi=kimi+1;
            if(kimi>num)
                break;
            end
        end
        
    end
    count=count+1;
end
[val_s,ind_s]=sort(sum_r,'descend');
for i = ind_s
    if(isempty( intersect(sensor_map,sensor_indicies(i))))
        if(sensor_node_visited(sensor_indicies(i))==0)
            sensor_map=[sensor_map,sensor_indicies(i)];
        end
    end
end

for i=index
    grid_map=[grid_map,grid_indices(i)];
end

% grid

end