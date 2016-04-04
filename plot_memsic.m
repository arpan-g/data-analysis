value=1;
maxValue=26486;
newDefaultColors = summer(8);
% set(gca, 'ColorOrder', newDefaultColors, 'NextPlot', 'replacechildren');
data_matrix=[node1(value,1:maxValue);...
    node2(value,1:maxValue);...
    node3(value,1:maxValue);...
    node4(value,1:maxValue);...
    node5(value,1:maxValue);...
    node6(value,1:maxValue);...
    node7(value,1:maxValue);...
    node8(value,1:maxValue)];

% for i = 1:8
%     for j = 1:maxValue
%         convert(i,j)=calculateTemperature(data_matrix(i,j));
%     end
% end
% imagesc(convert);
% Now get the new set of default plot colors.
% Verify it changed by printing out the new default color set to the command window.
% newColorOrder = get(gca,'ColorOrder');
% % figure1 = figure;
% plot(node1(value,:),'Color',newDefaultColors(1,:));
% hold on;
% plot(node2(value,:),'Color',newDefaultColors(2,:));
% hold on;
% plot(node3(value,:),'Color',newDefaultColors(3,:));
% hold on;
% plot(node4(value,:),'Color',newDefaultColors(4,:));
% hold on;
% plot(node5(value,:),'Color',newDefaultColors(5,:));
% hold on;
% plot(node6(value,:),'Color',newDefaultColors(6,:));
% hold on;
% plot(node7(value,:),'Color',newDefaultColors(7,:));
% hold on;
% plot(node8(value,:),'Color',newDefaultColors(8,:));
% hold on;
%
%
% % Now plot the datasets with the changed default colors.
% % plot(x,y, 'LineWidth', 3);
% grid on;
% legend('1','2','3','4','5','6','7','8')
% xlabel('time(s)');
% ylabel('sensor output');
% title('temperature sensor data');
% % saveas(figure1,'29_02/temp.png')
%
% mean_values(1)=mean(node1(value,:));
% mean_values(2)=mean(node2(value,:));
% mean_values(3)=mean(node3(value,:));
% mean_values(4)=mean(node4(value,:));
% mean_values(5)=mean(node5(value,:));
% mean_values(6)=mean(node6(value,:));
% mean_values(7)=mean(node7(value,:));
% mean_values(8)=mean(node8(value,:));

