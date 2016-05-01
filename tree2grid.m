%% Tree2Grid2
clear all;
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
[node_s,node_e]=prims(R*-1,1,8);
s_g_map=zeros(8,8);
s_g_map(1,1)=1;
a=matchTree(node_s,node_e,s_g_map);
% generateIsoMetricGraphs(node_s,node_e,6,n);
for k=1:n
    % for k=2
    copy_r=R;
    trial=1;
    for trial = 1:15
        
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
                
%                   assign_sensor2Grid(sensor_node_visited,number_mapping,node_e(top_n),b,copy_r);
                for j = 1:noOfLeaves
                    % how to assign between two nodes
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
                    % how to assign to more than one node
%                     assign_sensor2Grid(sensor_node_visited,number_mapping,node_e(top_n),b,copy_r);
                    sensor_node_mapping(node_e(top_n(j)))=b(j);
                    grid_node_visited(node_e(top_n(j)))=1;
                    sensor_node_visited(b(j))=1;
                end
                
                
            end
        end
        len=length(node_s);
        sum_trial(trial)=0;
        for i = 1:len
            s=find(sensor_node_mapping==node_s(i));
            e=find(sensor_node_mapping==node_e(i));
            if(~(isempty(s)||isempty(e)))
                sum_trial(trial)=sum_trial(trial)+R(s,e);
            end
        end
        trial_mapping(trial,:)=sensor_node_mapping;
    end % trial ends here
    [trial_value,trial_index]=max(sum_trial);
    sum_corr(k)=trial_value;
    placement(k,:)=trial_mapping(trial_index,:);
end

[val,ind]=max(sum_corr);
arrangement=placement(ind,:);
config=[1,2,3,4,5,6,7,8;2,1,4,3,6,5,8,7;8,7,6,5,4,3,2,1;7,8,5,6,3,4,1,2];
error_matrix=zeros(4,1);

% masters(corr_colum(1),:)
for config_iterator=1 :4
    for error_iterator =1:8
        
        
        if(config(config_iterator,error_iterator)~=arrangement(error_iterator))
            error_matrix(config_iterator)=error_matrix(config_iterator)+1;
        end
        
    end
end
[error,ind]=min(error_matrix);
% arrangement=masters(corr_colum(1),:);

%sensor_node_mapping indices = node_e,node_s, value @ indices sensor(r(indexes))