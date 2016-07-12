%  node(1)=light;
%         node(2)=temp;
%         node(3)=audio;
%         node(4)=time;
%         node(5)=packet_number;
%         node(6)=voltage;
%         node(7)=rssi;

% value=2;
maxValue=min([numel(node1),numel(node3),numel(node4),numel(node5),numel(node6),numel(node7),numel(node8)]);
maxValue=maxValue/7;
newDefaultColors=[1,0,0;0,1,0;0,0,1;0.5,0.5,0.5;0,0,0;1,0,0.8;0.4,0.2,0.7];
% newDefaultColors = colormap(parula(8));
% set(gca, 'ColorOrder', newDefaultColors, 'NextPlot', 'replacechildren');
data_matrix=[node3(value,1:maxValue);...
    node4(value,1:maxValue);...
    node5(value,1:maxValue);...
    node6(value,1:maxValue);...
    node7(value,1:maxValue);...
    node8(value,1:maxValue)];

[r,c]=size(data_matrix);
for i = 1:r
    for j = 1:maxValue
        if(value==2)
            convert(i,j)=calculateTemperature(data_matrix(i,j));
        elseif (value==1)
            convert(i,j)=calculateLux(data_matrix(i,j));
        else
            convert(i,j)=data_matrix(i,j);
        end
        
    end
end
% figure2=figure;
% imagesc(data_matrix);
% colorbar();
% xlabel('time(s)');
% ylabel('sensorId');
% Now get the new set of default plot colors.
% Verify it changed by printing out the new default color set to the command window.
newColorOrder = get(gca,'ColorOrder');
figure1 = figure;


for i = 1:r
    plot(convert(i,:),'Color',newDefaultColors(i,:));
    hold on;

end
% plot(node1(value,:),'Color',newDefaultColors(1,:));
% hold on;
% % plot(node2(value,:),'Color',newDefaultColors(2,:));
% % hold on;
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
% %
% %
% % % Now plot the datasets with the changed default colors.
% % % plot(x,y, 'LineWidth', 3);
% % grid on;

if(value==1)
    str='light sensor(lux)';
elseif(value==2)
    str='temp(Celsius)';
elseif(value==3)
    str='acoustic)';
elseif(value==7)
    str='rssi(db)';
end
legend('3','4','5','6','7','8')
xlabel('time(s)');
ylabel(str);

saveas(figure1,analog);
% saveas(figure2,heatMap);
%
% mean_values(1)=mean(node1(value,:));
% mean_values(2)=mean(node2(value,:));
% mean_values(3)=mean(node3(value,:));
% mean_values(4)=mean(node4(value,:));
% mean_values(5)=mean(node5(value,:));
% mean_values(6)=mean(node6(value,:));
% mean_values(7)=mean(node7(value,:));
% mean_values(8)=mean(node8(value,:));

