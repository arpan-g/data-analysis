function[R]=power_consumption(file)
% num_mins=12;
clear energyMatrix;
clear filteredMatrix;
clear newPirArray;
% time_period=t*36000;
window_size = 36;%num_mins min=num_mins*60*10ms
overlap_size = window_size/2;
load(file);
% combine_data=newPirArray(:,start_time*36000+1:end_time*36000);
% combine_data=newPirArray(:,1:8*36000);
% combine_data=data_combine;
% index=[27,22,15,28,23,16,29,24,17,30,25,18];
combine_data=newPirArray;
% combine_data=newPirArray(index,:);


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
% 
% newCount=1;
% for i = 1:count-5
%     
%         if(max(energyMatrix(:,i)+energyMatrix(:,i+1)+energyMatrix(:,i+2)+energyMatrix(:,i+3))>0)
% %     if(max(energyMatrix(:,i)>0))
%         filteredMatrix(:,newCount)=energyMatrix(:,i);
%         newCount=newCount+1;
%     end
% end

R=correlation_pearson(transpose(energyMatrix));

%
% figure3=figure;
% imagesc(filteredMatrix);
% colorbar();
% xlabel('nodeID');
% ylabel('nodeID');
% % [RHO,PVAL] = corr(a',b','Type','Spearman');

% R2=correlation_pearson(transpose(energyMatrix));
% R=R1+R2;
% % R1=correlation_pearson(transpose(filteredMatrix));
% R=corr(transpose(energyMatrix),'Type','Spearman');
% R=corrcoef(transpose(energyMatrix));
% % R=corrcoef(transpose(standardDeviationMatrix));
% for l =1:8
%     for m =1:8
%         graphMatrix(l,m)=R(l,m)>=0.34;
%     end
% 
% end
% figure;
% imagesc(energyMatrix);
% % plot(G);
% % figure2=figure;
% % % % %
% % len=size(R);
% figure
% h=imagesc(R);
% xlabel('nodeId');ylabel('nodeId');
% impixelregion(h);
% textStrings = num2str(R(:),'%0.2f');  %# Create strings from the matrix values
% textStrings = strtrim(cellstr(textStrings));  %# Remove any space padding
% [x,y] = meshgrid(1:len(1));   %# Create x and y coordinates for the strings
% hStrings = text(x(:),y(:),textStrings(:),...      %# Plot the strings
%     'HorizontalAlignment','center');
% midValue = mean(get(gca,'CLim'));  %# Get the middle value of the color range
% textColors = repmat(R(:) < 0.5,1,3);  %# Choose white or black for the
% %#   text color of the strings so
% %#   they can be easily seen over
% %#   the background color
% set(hStrings,{'Color'},num2cell(textColors,2));
% colorbar();
% % % % saveas(figure3,power_file);
% saveas(figure1,ppl)
% saveas(figure2,'04_04/corr_fire.png')
%
% clearvars -except newPirArray energyMatrix DCMatrix R
% clear newPirArray;
end