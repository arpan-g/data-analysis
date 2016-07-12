% R=power_consumption('combined_data\combi.mat');
% [s,e]=prims(R*-1,1,n);
% plot_tree(s,e);
% 
% 
% a=zeros(43,8);
% for i = 1:43
%     [v,ind]=find(a_m(i,:)==1);
%     a(i,1:numel(ind))=ind;
% end
% % for i = 1:43
% % plot(sensor_cordinates(i,1),sensor_cordinates(i,2),'*');
% % 
% % hold on;
% % end
% % clear all
% %  load('C:\arpan\Thesis\data_analysis\data-analysis\txt_files\ai_lab\ai_lab_44_4_11_ori.mat')
% sensor_array=[27,22,15,28,23,16,29,24,17,30,25,18];
% count=1;
% for i =sensor_array
% 
%     pirArray(count,:)=newPirArray(i,:);
%     count=count+1;
% end
% clear newPirArray
% 
% newPirArray=pirArray;
% file='C:\arpan\Thesis\data_analysis\data-analysis\people_count\pir_07_04_3_ppl_data.mat';
% load(file);
ppl='C:\arpan\Thesis\data_analysis\data-analysis\people_count_1\pir_06_07_0_ppl_data.png';
energy='C:\arpan\Thesis\data_analysis\data-analysis\people_count_1\pir_06_07_0_ppl_energy.png';
figure1=figure;
imagesc(newPirArray)
xlabel('time(x0.1s)');
ylabel('sensorID');
colorbar();
figure2=figure;
window_size = 36;%num_mins min=num_mins*60*10ms
overlap_size = window_size/2;

combine_data=newPirArray;



len=size(combine_data);


for i = 1:len(1)
    count =1;
    for k = 1:overlap_size:len(2)
        if(k+window_size<len(2))
            values=combine_data(i,k:k+window_size-1);
            energyMatrix(i,count)= sum(values);
            count = count +1;
        end
    end
end

imagesc(energyMatrix);
xlabel('time(x0.1s)');
ylabel('sensorID');
colorbar();
% save('txt_files\ai_lab\ai_lab_grid_3X4_5.mat','newPirArray');
saveas(figure1,ppl);
saveas(figure2,energy);
clear energyMatrix;
