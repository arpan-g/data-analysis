
clear corrValues;
clear graphMatrix;
figure1 = figure;
node_id = 8;
a=mega_imf;
% a=[pirA ;pirB; pirC; pirD;pirE; pirF; pirG;pirH];
% a = [node1(value,1:6778);node2(value,1:6778);node3(value,1:6778);node4(value,1:6778);node5(value,1:6778);node6(value,1:6778);node7(value,1:6778);node8(value,1:6778)];
% plotTitle = ['correlation variation'];
for j = 1:8
    for i = 1:8
        
        [c,lags] = xcorr(a(j,:),a(i,:),0,'coeff');
%         c=corrcoef(a(j,:),a(i,:));
%         corrValues(j,i) = abs(c(1,2));
        corrValues(j,i) = max(c);
%         graphMatrix(j,i) = (corrValues(j,i) > 0.30);
       
        
        
    end
end

h=imagesc(corrValues);
xlabel('nodeId');ylabel('nodeId');
% impixelregion(h);
textStrings = num2str(corrValues(:),'%0.2f');  %# Create strings from the matrix values
textStrings = strtrim(cellstr(textStrings));  %# Remove any space padding
[x,y] = meshgrid(1:8);   %# Create x and y coordinates for the strings
hStrings = text(x(:),y(:),textStrings(:),...      %# Plot the strings
    'HorizontalAlignment','center');
midValue = mean(get(gca,'CLim'));  %# Get the middle value of the color range
textColors = repmat(corrValues(:) < midValue,1,3);  %# Choose white or black for the
%#   text color of the strings so
%#   they can be easily seen over
%#   the background color
set(hStrings,{'Color'},num2cell(textColors,2));
colorbar();
saveas(figure1,'22_2/correlated.png');
