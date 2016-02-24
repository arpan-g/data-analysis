%calculate binary coefficients
clear corr_matrix;
window_size = 2400;%4min=4*60*10*100ms
% figure1=figure;
combine_data = [pirA ;pirB; pirC; pirD;pirE; pirF; pirG;pirH];
len=size(combine_data);
count = 1;
for i=1:8
    for j=1:8
        for k = 1:window_size:length(2)
            if(window_size+k<length(2))
                
                a=similar_data(combine_data(i,k:k+window_size-1),combine_data(j,k:k+window_size-1),0);
                d=similar_data(combine_data(i,k:k+window_size-1),combine_data(j,k:k+window_size-1),1);
                p_1=sum(combine_data(i,k:k+window_size-1)); %number of 1's in 1st array
                p_2=sum(combine_data(j,k:k+window_size-1));%number of 1'2 in 2nd array
                [b,c] = disimilar_data(combine_data(i,k:k+window_size-1),combine_data(j,k:k+window_size-1));
                %b= proportion of 1s in the first variable and 0s in second
                %variable in the same positions
                %c = proportion of 0s in the first variable and 1s in second variable
                % in the same positions
                q_1 = window_size-p_1; % number of 0's in 1st array 
                q_2 = window_size-p_2; % number of 0's in 2nd array
                numerator = a*d-b*c;
                denominator = sqrt(p_1*p_2*q_1*q_2);
                if(denominator~=0)
                corr_matrix(count,i,j) = numerator /(denominator);
                graphMatrix(count,i,j) = (corr_matrix(i,j) > 0.30);
                count = count +1;
                end
            end
        end
    end
end
% h=imagesc(corr_matrix);
% xlabel('nodeId');ylabel('nodeId');
% % impixelregion(h);
% textStrings = num2str(corr_matrix(:),'%0.2f');  %# Create strings from the matrix values
% textStrings = strtrim(cellstr(textStrings));  %# Remove any space padding
% [x,y] = meshgrid(1:8);   %# Create x and y coordinates for the strings
% hStrings = text(x(:),y(:),textStrings(:),...      %# Plot the strings
%     'HorizontalAlignment','center');
% midValue = mean(get(gca,'CLim'));  %# Get the middle value of the color range
% textColors = repmat(corr_matrix(:) < midValue,1,3);  %# Choose white or black for the
% %#   text color of the strings so
% %#   they can be easily seen over
% %#   the background color
% set(hStrings,{'Color'},num2cell(textColors,2));
% colorbar();