clear corr_matrix;
window_size = 2400;%4min=4*60*10*100ms
figure1=figure;
% combine_data = [pirA ;pirB; pirC; pirD;pirE; pirF; pirG;pirH];
combine_data=newPirArray;
len=size(combine_data);
count = 1;
for i=1:8
    for j=1:8
        
        
        d=similar_data(combine_data(i,:),combine_data(j,:),0);
        a=similar_data(combine_data(i,:),combine_data(j,:),1);
        p_1=sum(combine_data(i,:)); %number of 1's in 1st array
        p_2=sum(combine_data(j,:));%number of 1'2 in 2nd array
        
        [b,c] = disimilar_data(combine_data(i,:),combine_data(j,:));
        q_1 = c+d; % number of 0's in 1st array
        q_2 = b+d; % number of 0's in 2nd array
        %b= proportion of 1s in the first variable and 0s in second
        %variable in the same positions
        %c = proportion of 0s in the first variable and 1s in second variable
        % in the same positions
                         value=correlation_coefficient(a,p_1,p_2);
        %                 value=gleas( a,p_1,p_2 );
        %                 value=jacard( a,b,c );
        %                 value=bb( a,p_1,p_2 );
%         value=loevinger(a,b,c,d,p_1,p_2,q_1,q_2);
%                         value=cohen(a,b,c,d,p_1,p_2,q_1,q_2);
%                         value=rr( a,b,c,d );
%                         value=simple_matching_coefficient(a,b,c,d);
        
        
        %             corr_matrix(i,j) = loevinger(a,b,c,d,p_1,p_2,q_1,q_2);
        corr_matrix(i,j) =  value;
        
    end
end
h=imagesc(corr_matrix);
xlabel('nodeId');ylabel('nodeId');
% impixelregion(h);
textStrings = num2str(corr_matrix(:),'%0.2f');  %# Create strings from the matrix values
textStrings = strtrim(cellstr(textStrings));  %# Remove any space padding
[x,y] = meshgrid(1:8);   %# Create x and y coordinates for the strings
hStrings = text(x(:),y(:),textStrings(:),...      %# Plot the strings
    'HorizontalAlignment','center');
midValue = mean(get(gca,'CLim'));  %# Get the middle value of the color range
textColors = repmat(corr_matrix(:) < midValue,1,3);  %# Choose white or black for the
%#   text color of the strings so
%#   they can be easily seen over
%#   the background color
set(hStrings,{'Color'},num2cell(textColors,2));
colorbar();
saveas(figure1,'29_02/bin_coeff_normal_cc.png')