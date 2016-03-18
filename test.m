optimistic_neighbouring_map=[ 1     1     1     -1     0     0     0     0;    1     1     -1     1     0     0     0     0;    1     -1     1     1     1     -1     0     0;    -1     1     1     1     -1     1     0     0;    0     0     1     -1     1     1     1     -1;    0     0     -1     1     1     1     -1     1;    0     0     0     0     1     -1     1     1;    0     0     0     0     -1     1     1     1];
% optimistic_neighbouring_map=abs(optimistic_neighbouring_map);
count = ones(3,1);

for i = 1:8
    for j = i+1 : 8
        switch optimistic_neighbouring_map(i,j)
            case 1
                one_matrix(count(1),:) = [R(i,j),1];
                count(1)=count(1)+1
            case 0
                zero_matrix(count(2),:) = [R(i,j),0];
                count(2)=count(2)+1
            case -1
                minus_matrix(count(3),:) = [R(i,j),-1];
                count(3) = count(3) +1;
        end
    end
end
% c = round(linspace(1,1,length(plot_matrix(:,1))));
figure1=figure('units','normalized','position',[.1 .1 .2 .3]);
scatter(one_matrix(:,2),one_matrix(:,1),25,'d');
hold on;
scatter(zero_matrix(:,2),zero_matrix(:,1),'x');
hold on;
scatter(minus_matrix(:,2),minus_matrix(:,1),'*');
hold on;
hline = refline([0 max(zero_matrix(:))]);
% hline.Color = 'r';
legend('neighbors','non neighbors','diagonal neighbors');
xlabel('class');
ylabel('correlation coefficients');
ylim([min(zero_matrix(:)) max(one_matrix(:))]);
xlim([-1.2,1.2]);
ax = gca;
% ax.XTick = [-3*pi -2*pi -pi 0 pi 2*pi 3*pi];
ax.XTickLabel = {'diagonal','non neighbors','neighbors'};
saveas(figure1,scatter_plot)