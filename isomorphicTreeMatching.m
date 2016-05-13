% clear all;
% power_consumption

[n,~]=size(R);
% if(n==6)
%     a_m=[0,1,1,0,0,0;1,0,0,1,0,0;1,0,0,1,1,0;0,1,1,0,0,1;0,0,1,0,0,1;0,0,0,1,1,0];
% elseif(n==8)
%     
%     a_m=...
%         [0,1,1,zeros(1,5);...
%         1,0,0,1,zeros(1,4);...
%         1,0,0,1,1,0,0,0;...
%         0,1,1,0,0,1,0,0;...
%         0,0,1,0,0,1,1,0;...
%         0,0,0,1,1,0,0,1;...
%         0,0,0,0,1,0,0,1;...
%         0,0,0,0,0,1,1,0];
% elseif(n==12)    
%     a_m=...
%         [0,1,0,1,1,0,0,0,0,0,0,0;...
%         1,0,1,1,1,1,0,0,0,0,0,0;...
%         0,1,0,0,1,1,0,0,0,0,0,0;...
%         1,1,0,0,1,0,1,1,0,0,0,0;...
%         1,1,1,1,0,1,1,1,1,0,0,0;...
%         0,1,1,0,1,0,0,1,1,0,0,0;...
%         0,0,0,1,1,0,0,1,0,1,1,0;...
%         0,0,0,1,1,1,1,0,1,1,1,1;...
%         0,0,0,0,1,1,0,1,0,0,1,1;...
%         0,0,0,0,0,0,1,1,0,0,1,0;...
%         0,0,0,0,0,0,1,1,1,1,0,1;...
%         0,0,0,0,0,0,0,1,1,0,1,0];
% elseif(n==16)
%     a_m=...
% [0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0;...
% 1,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0;...
% 1,0,0,1,0,1,1,0,0,0,0,0,0,0,0,0;...
% 0,1,1,0,1,1,1,1,0,0,0,0,0,0,0,0;...
% 0,0,0,1,0,0,1,1,0,0,0,0,0,0,0,0;...
% 0,0,1,1,0,0,1,0,1,1,0,0,0,0,0,0;...
% 0,0,1,1,1,1,0,1,1,1,1,0,0,0,0,0;...
% 0,0,0,1,1,0,1,0,0,1,1,0,0,0,0,0;...
% 0,0,0,0,0,1,1,0,0,1,0,1,1,0,0,0;...
% 0,0,0,0,0,1,1,1,1,0,1,1,1,1,0,0;...
% 0,0,0,0,0,0,1,1,0,1,0,0,1,1,0,0;...
% 0,0,0,0,0,0,0,0,1,1,0,0,1,0,0,0;...
% 0,0,0,0,0,0,0,0,1,1,1,1,0,1,0,0;...
% 0,0,0,0,0,0,0,0,0,1,1,0,1,0,1,1;...
% 0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1;...
% 0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0];
% end
% 
a_m=getAdjacencyMatrix();
root=round(rand*n);
if(root==0)
    root=1;
end
% count = 1;
% for i = 1:num_rows
%     for j = 1:num_cols
%         sensor_cordinates(count,:)=[i,j];
%         count= count + 1;
%     enda
% end


% distance_measure=zeros(n);
% for i = 1:n
%     for j = 1:n
%         distance_measure(i,j)=distance_euclidean(sensor_cordinates(i,:),sensor_cordinates(j,:));
%     end
% end
% power_consumption
root=1;n=23;
[node_s,node_e]=prims(R*-1,root,n);
s_g_map=zeros(n,n);
max_sum=calculate_correlation_sum(node_s,node_e,R);
% profile on
for i=1:n
    % i=1;
    s_g_map(node_s(1),1)=i;
    matchTree(node_s,node_e,s_g_map,1);
end
% profile viewer
readFile
mapping=tree;
[r,c]=size(mapping);
sum_r=0;
for i=1:r
    % for j = 1:n-1
    sum_r(i)=  calculate_correlation_sum_grid(mapping(i,:),R,a_m);
     
    % end
    
end
% mapping_all(i,:)=mapping;
% end
[v,index_temp]=max(sum_r);
index=find(sum_r==v);
arrangement=mapping(index,:);
% config=[1,2,3,4,5,6,7,8;2,1,4,3,6,5,8,7;8,7,6,5,4,3,2,1;7,8,5,6,3,4,1,2];
% % config=[1,2,3,4,5,6,7,8,9,10,11,12;3,2,1,6,5,4,9,8,7,12,11,10;10,11,12,7,8,9,4,5,6,1,2,3;12,11,10,9,8,7,6,5,4,3,2,1];
% error_matrix=zeros(4,1);
% %
% % % masters(corr_colum(1),:)
% for config_iterator=1 :4
%     for error_iterator =1:n
%
%
%         if(config(config_iterator,error_iterator)~=arrangement(error_iterator))
%             error_matrix(config_iterator)=error_matrix(config_iterator)+1;
%         end
%
%     end
% end
% [error,ind]=min(error_matrix);

