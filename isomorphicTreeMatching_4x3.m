% clear all;
file_txt='test.txt';
fileID_local = fopen(file_txt,'w');
fclose(fileID_local);


tic;
% 45


R = power_consumption(file);
% R = power_consumption('WSU\ai_lab_69.mat');
[n,~]=size(R);
root=round(rand*n);
% if(root==0)
    root=1;
% end

[node_s,node_e]=prims(R*-1,root,n);
sensor_cordinates=readCoordinates('wsu_4X3.txt');
sensor_cordinates=sensor_cordinates*0.4;

a_m=zeros(n,n);
for i = 1:n
    for j = 1:n
        
        val=isWithInsquare(sensor_cordinates(i,:),sensor_cordinates(j,:),4*0.3);
        a_m(i,j)=val;
         
    end
end
test_a_m;
sum(b)
tic
s_g_map=zeros(n,1);
for i=1:n
    s_g_map(node_s(1),1)=i;
    matchTree(node_s,node_e,s_g_map,1,a_m);
%     i
end
toc
mapping=readFile4x3('test.txt');
[r,c]=size(mapping);
sum_r=zeros(r,1);
for i=1:r
    sum_r(i)=  calculate_correlation_sum_grid(mapping(i,:),R,a_m);
end
[v,index_temp]=max(sum_r);
arrangement=mapping((abs(sum_r-v))<0.0001,:);
