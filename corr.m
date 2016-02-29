
clear corrValues;
clear graphMatrix;
range=16728;
figure1 = figure;
node_id = 8;
% a=[pirA ;pirB; pirC; pirD;pirE; pirF; pirG;pirH];
a = [node1(value,1:range);node2(value,1:range);node3(value,1:range);node4(value,1:range);node5(value,1:range);node6(value,1:range);node7(value,1:range);node8(value,1:range)];
plotTitle = ['correlation variation'];
for j = 1:8
    for i = 1:8
        
%         [c,lags] = xcorr(a(j,:),a(i,:),0,'coeff');
        c=corrcoef(a(j,:),a(i,:));
        corrValues(j,i) = abs(c(1,2));
%         corrValues(j,i) = max(c);
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
title('light sensor');
saveas(figure1,'29_02/correlated_light.png');
