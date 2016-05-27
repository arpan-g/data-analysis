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
% for i = 1:43
% plot(sensor_cordinates(i,1),sensor_cordinates(i,2),'*');
% 
% hold on;
% end
% clear all
%  load('C:\arpan\Thesis\data_analysis\data-analysis\txt_files\ai_lab\ai_lab_44_4_11_ori.mat')
sensor_array=[27,22,15,28,23,16,29,24,17,30,25,18];
count=1;
for i =sensor_array

    pirArray(count,:)=newPirArray(i,:);
    count=count+1;
end
clear newPirArray

newPirArray=pirArray;
save('txt_files\ai_lab\ai_lab_grid_3X4_5.mat','newPirArray');

