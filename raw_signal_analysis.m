load(file);
newPirArray=data_combine;
for i = 1:8
    for j = 1:8
        a=similar_data(newPirArray(i,:),newPirArray(j,:),1);
        d=similar_data(newPirArray(i,:),newPirArray(j,:),0);
        p_1=sum(newPirArray(i,:)); %number of 1's in 1st array
        p_2=sum(newPirArray(j,:));%number of 1'2 in 2nd array
        [b,c] = disimilar_data(newPirArray(i,:),newPirArray(j,:));
        R(i,j)=bb(a,p_1,p_2);
    end
end
for i =1:8
    for j =1:8
        
        graphMatrix(i,j)=R(i,j)>0.40;
    end
    
end
G= graph(graphMatrix);
plot(G);
figure;
h=imagesc(R);
xlabel('nodeId');ylabel('nodeId');
% impixelregion(h);
textStrings = num2str(R(:),'%0.2f');  %# Create strings from the matrix values
textStrings = strtrim(cellstr(textStrings));  %# Remove any space padding
[x,y] = meshgrid(1:8);   %# Create x and y coordinates for the strings
hStrings = text(x(:),y(:),textStrings(:),...      %# Plot the strings
    'HorizontalAlignment','center');
midValue = mean(get(gca,'CLim'));  %# Get the middle value of the color range
textColors = repmat(R(:) < midValue,1,3);  %# Choose white or black for the
%#   text color of the strings so
%#   they can be easily seen over
%#   the background color
set(hStrings,{'Color'},num2cell(textColors,2));
colorbar();

