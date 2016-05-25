% R=power_consumption('combined_data\combi.mat');
% [s,e]=prims(R*-1,1,n);
% plot_tree(s,e);
% 
% 
a=zeros(43,8);
for i = 1:43
    [v,ind]=find(a_m(i,:)==1);
    a(i,1:numel(ind))=ind;
end
for i = 1:43
plot(sensor_cordinates(i,1),sensor_cordinates(i,2),'*');

hold on;
end
