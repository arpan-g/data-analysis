clear all;
file_txt='test.txt';
fileID_local = fopen(file_txt,'w');
fclose(fileID_local);


tic;
name='ai_lab_46';
%  R = power_consumption(['C:\arpan\Thesis\data_analysis\data-analysis\WSU\',name,'.mat']);

R = power_consumption('txt_files\ai_lab\ai_lab_grid_43_58n83.mat');
% R = power_consumption('WSU\ai_lab_69.mat');
[n,~]=size(R);
root=round(rand*n);
if(root==0)
    root=1;
end
% root=35;
[node_s,node_e]=prims(R*-1,root,n);
% plot_tree(node_s,node_e);
% plot_tree(node_s,node_e);
%
% max_sum=calculate_correlation_sum(node_s,node_e,R);
% R = power_consumption('combined_data\combi_7.mat');
%
n=43;
% sensor_cordinates=readCoordinates('wsu_4X3.txt');
sensor_cordinates=readCoordinates('wsu_ai_lab.txt');
sensor_cordinates=sensor_cordinates*0.4;
% sensor_cordinates=readCoordinates('HTC34_Coordinates.txt');
% % n=43;
% distance_measure=zeros(n);
a_m=zeros(n,n);
for i = 1:n
    for j = 1:n
        if(i~=j)
                    val=isWithInsquare(sensor_cordinates(i,:),sensor_cordinates(j,:),4*0.3);
                    a_m(i,j)=val;
    %         a_m(j,i)=val;
            distance_measure(i,j)=distance_euclidean(sensor_cordinates(i,:),sensor_cordinates(j,:));
        else
            distance_measure(i,i) = 999;
        end
    end
end

a_m=getAdjacencyMatrix();

test_a_m
sum(b)
tic
s_g_map=zeros(n,1);
for i=1:n
    s_g_map(node_s(1),1)=i;
    matchTree(node_s,node_e,s_g_map,1,a_m);
    i
end
toc

readFile
mapping=tree;
[r,c]=size(mapping);
sum_r=zeros(r,1);
for i=1:r
    sum_r(i)=  calculate_correlation_sum_grid(mapping(i,:),R,a_m);     
end
% mapping_all(i,:)=mapping;

[v,index_temp]=max(sum_r);
% for i = 1:r
%     if(sum_r(i)==v)
%         i
%     end
% end

% index=sum_r;

arrangement=mapping((abs(sum_r-v))<0.0001,:);
new_arr=compute_weighted_arrangement(arrangement,a_m,distance_measure,R);

% [num_mappings,~]=size(mapping);
% sum_r_i=zeros(num_mappings,1);
% for i=1:num_mappings
%     % for j = 1:n-1
%     sum_r_i(i)=  calculate_correlation_sum_grid(mapping(i,:),R.*inv_distance_measure,a_m);
%     
%     % end
%     
% end
% [v,~]=max(sum_r_i);
% arrangement_i=mapping((sum_r_i==v),:);
% config=[1,2,3,4,5,6,7,8;2,1,4,3,6,5,8,7;8,7,6,5,4,3,2,1;7,8,5,6,3,4,1,2];

% config=[1,2,3,4,5,6,7,8,9,10,11,12;3,2,1,6,5,4,9,8,7,12,11,10;10,11,12,7,8,9,4,5,6,1,2,3;12,11,10,9,8,7,6,5,4,3,2,1];
% config=1:43;
% [r,~]=size(arrangement);
% c_ar=round(rand*r);
% if(c_ar==0)
%     c_ar=1;
% end
% toc;
% error_matrix=zeros(4,1);
% for config_iterator=1 :4
%     for error_iterator =1:n
%         
%         
%         if(config(config_iterator,error_iterator)~=arrangement(c_ar,error_iterator))
%             error_matrix(config_iterator)=error_matrix(config_iterator)+1;
%         end
%         
%     end
% end
% [error,ind]=min(error_matrix);

