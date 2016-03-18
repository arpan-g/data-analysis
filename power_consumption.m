% num_mins=12;

% clc;close all;
clear standardDeviationMatrix;
clear total_pow;
clear energyMatrix;
window_size = 48;%num_mins min=num_mins*60*10ms
overlap_size = window_size/2;
% rand_array=[1,2,3,4,5,6,7,8];
% rand_array=[1,3,4,8,2,5,7,6];

load(file);
% load('pir_17_03.mat');
combine_data = zeros(8,8);
% combine_data=newPirArray(rand_array(1),:);
% for i =2:8
% combine_data = [combine_data;newPirArray(rand_array(i),:)];
%     end
combine_data=newPirArray;
len=size(combine_data);

for i = 1:8
    count =1;
    for k = 1:overlap_size:len(2)
        if(k+window_size<len(2))
            values=combine_data(i,k:k+window_size-1);
            %             time_power(i,count) = sum(values);
            %             F = fft(values);
            %             pow = F.*conj(F);
            %             mean=abs(F(1));
            %             total_pow = sum(pow);
            %             DCMatrix(i,count)=mean;
            %             standardDeviationMatrix(i,count)=std(pow);
            energyMatrix(i,count)= sum(values);
            count = count +1;
        end
    end
end
newCount=1;
for i = 1:count-1
    
    if(max(energyMatrix(:,i)>0))
        
        filteredMatrix(:,newCount)=energyMatrix(:,i);
        newCount=newCount+1;
    end
end
%
% figure3=figure;
% imagesc(filteredMatrix);
% colorbar();
% xlabel('nodeID');
% ylabel('nodeID');
% % [RHO,PVAL] = corr(a',b','Type','Spearman');
R=correlation_pearson(transpose(filteredMatrix));
% % R1=correlation_pearson(transpose(filteredMatrix));
% % R=corrcoef(transpose(energyMatrix),'Spearman');
% % R=corrcoef(transpose(energyMatrix));
% % R=corrcoef(transpose(standardDeviationMatrix));
% for l =1:8
%     for m =1:8
%         graphMatrix(l,m)=R(l,m)>=0.34;
%     end
%
% end
% figure1=figure;
% G= graph(graphMatrix);
% plot(G);
% figure2=figure;
% % %
% h=imagesc(R);
% xlabel('nodeId');ylabel('nodeId');
% % impixelregion(h);
% textStrings = num2str(R(:),'%0.2f');  %# Create strings from the matrix values
% textStrings = strtrim(cellstr(textStrings));  %# Remove any space padding
% [x,y] = meshgrid(1:8);   %# Create x and y coordinates for the strings
% hStrings = text(x(:),y(:),textStrings(:),...      %# Plot the strings
%     'HorizontalAlignment','center');
% % midValue = mean(get(gca,'CLim'));  %# Get the middle value of the color range
% textColors = repmat(R(:) < 0.5,1,3);  %# Choose white or black for the
% %#   text color of the strings so
% %#   they can be easily seen over
% %#   the background color
% set(hStrings,{'Color'},num2cell(textColors,2));
% colorbar();
% saveas(figure3,power_file);
% saveas(figure1,corr_file)
% saveas(figure2,map_file)
%
% clearvars -except newPirArray energyMatrix DCMatrix R
