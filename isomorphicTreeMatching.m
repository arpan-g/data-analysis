% clear all;
file_txt='test.txt';
fileID_local = fopen(file_txt,'w');
fclose(fileID_local);
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
% a_m=getAdjacencyMatrix();
%  a_m=[0,1,1,0,0,0;1,0,0,1,0,0;1,0,0,1,1,0;0,1,1,0,0,1;0,0,1,0,0,1;0,0,0,1,1,0];

tic;
% R = power_consumption('combined_data\combi_4.mat');
R = power_consumption('txt_files\ai_lab\ai_lab_44_4_11_ori.mat');
[n,~]=size(R);
root=round(rand*n);
if(root==0)
    root=1;
end
[node_s,node_e]=prims(R*-1,root,n);
% plot_tree(node_s,node_e);

max_sum=calculate_correlation_sum(node_s,node_e,R);
% R = power_consumption('combined_data\combi_7.mat');


sensor_cordinates=readCoordinates('wsu_ai_lab.txt');
sensor_cordinates=sensor_cordinates*0.4;
% sensor_cordinates=readCoordinates('HTC34_Coordinates.txt');
% n=43;
distance_measure=zeros(n);
a_m=zeros(n,n);
for i = 1:n
    for j = 1:n
        if(i~=j)
        val=isWithInsquare(sensor_cordinates(i,:),sensor_cordinates(j,:),4*0.3);
        a_m(i,j)=val;
%         a_m(j,i)=val;
        else
            a_m(i,i) = 0;
        end
    end
end
% radius = computePIRRadius(3,41);

%  a_m(distance_measure<(2*radius))=1;
% a_m(distance_measure<=(4*sqrt(2)*0.3048))=1;
a_m(16,10)=1;
a_m(10,16)=1;
a_m(40,42)=1;
a_m(42,40)=1;
% power_consumption
% root=1;n=43; 
% root=1;

% profile on
s_g_map=zeros(n,1);
for i=1:n
%     i=1;
    s_g_map(node_s(1),1)=i;
    matchTree(node_s,node_e,s_g_map,1,a_m);
end

% profile viewer
readFile
mapping=tree;
[r,c]=size(mapping);
sum_r=zeros(r,1);

for i=1:r
    % for j = 1:n-1
    sum_r(i)=  calculate_correlation_sum_grid(mapping(i,:),R,a_m);
     
    % end
    
end
% mapping_all(i,:)=mapping;
% end
[v,index_temp]=max(sum_r);
% for i = 1:r
%     if(sum_r(i)==v)
%         i
%     end
% end

% index=sum_r;
arrangement=mapping((sum_r==v),:);
[num_mappings,~]=size(arrangement);

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

