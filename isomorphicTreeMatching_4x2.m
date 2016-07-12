% clear all;
file_txt='test.txt';
fileID_local = fopen(file_txt,'w');
fclose(fileID_local);


% tic;

 R = power_consumption(file,start_time*36000,end_time*36000);



[n,~]=size(R);
root=round(rand*n);
if(root==0)
    root=1;
end
% root=35;
[node_s,node_e]=prims(R*-1,root,n);

sensor_cordinates=readCoordinates('HTC34_Coordinates.txt');

distance_measure=zeros(n);
a_m=zeros(n,n);
for i = 1:n
    for j = 1:n
        if(i~=j)

            distance_measure(i,j)=distance_euclidean(sensor_cordinates(i,:),sensor_cordinates(j,:));
        else
            distance_measure(i,i) = 999;
        end
    end
end
radius = computePIRRadius(3,41);
a_m(distance_measure<(2*radius))=1;

% profile on
test_a_m
sum(b)

s_g_map=zeros(n,1);
tic
for i=1:n
    s_g_map(node_s(1),1)=i;
    matchTree(node_s,node_e,s_g_map,1,a_m);
%     i
end
toc
% profile viewer
readFile8
mapping=tree;
[r,c]=size(mapping);
sum_r=zeros(r,1);
% for i=1:r
  arrangement=   compute_weighted_arrangement(mapping,a_m,distance_measure,R);    
% end
% mapping_all(i,:)=mapping;

% [v,index_temp]=max(sum_r);

% index=sum_r;
% arrangement=mapping((abs(sum_r-v))<0.0001,:);
% new_arr=compute_weighted_arrangement(arrangement,a_m,distance_measure,R);



