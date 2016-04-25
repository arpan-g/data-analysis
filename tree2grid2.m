%% Tree2Grid2
% clear all;

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
for k=1:n
% for k=2
    copy_r=R;
    
    
    for i = 1:n
        copy_r(i,i)=0;
    end
    %     to itterate over all nodes as root
    [node_s,node_e]=prims(distance_measure,k,n);
    count=1;
    number_mapping=zeros(1,2);
    % [a,b]=calculate_maximum(copy_r,2);
    for i=1:n-1
        if(~isempty(intersect(number_mapping(:,1),node_s(i))))
            [r,c,v]= find(number_mapping==node_s(i));
            number_mapping(r,2)= number_mapping(r,2)+1;
            
        else
            number_mapping(count,1)=node_s(i);
            number_mapping(count,2)=1;
            count=count+1;
        end
    end
    grid_node_visited=zeros(n,1);
    sensor_node_visited=zeros(n,1);
    sensor_node_mapping=zeros(n,1);
    edgeGraph=[node_s;node_e];
    for i = 1:n-1
        start_node=node_s(i);
        end_node=node_e(i);
        if(grid_node_visited(start_node)==1 && grid_node_visited(end_node)==1)
            continue;
        end
        [noOfLeaves,top_n]=getNumberOfElements(node_s,start_node);
        
        % top node sensor mapped
        if( grid_node_visited(start_node)==1)
            %get the
            [v,indices] =sort(copy_r(sensor_node_mapping(start_node),:),'descend');
            
            
            for j = 1:noOfLeaves
                for indices_iterate = indices
                    if(sensor_node_visited(indices_iterate)==0)
                        sensor_node_mapping(node_e(top_n(j)))=indices_iterate;
                        grid_node_visited(node_e(top_n(j)))=1;
                        sensor_node_visited(indices_iterate)=1;
                        break;
                    end
                    
                end
            end
            
        else
            %first visit
            [a,b]=calculate_maximum(copy_r,noOfLeaves);
            sensor_node_mapping(start_node)=a;
            sensor_node_visited(a)=1;
            
            grid_node_visited(start_node)=1;
            for j = 1:noOfLeaves
                sensor_node_mapping(node_e(top_n(j)))=b(j);
                grid_node_visited(node_e(top_n(j)))=1;
                sensor_node_visited(b(j))=1;
            end
            
            
        end
    end
    len=length(node_s);
sum_corr(k)=0;
for i = 1:len
    s=find(sensor_node_mapping==node_s(i));
    e=find(sensor_node_mapping==node_e(i));
    if(~(isempty(s)||isempty(e)))
    sum_corr(k)=sum_corr(k)+R(s,e);
    end
end
    placement(k,:)=sensor_node_mapping;
end

[val,ind]=max(sum_corr);
arrangement=placement(ind,:);

%sensor_node_mapping indices = node_e,node_s, value @ indices sensor(r(indexes))