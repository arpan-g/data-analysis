start=1;
finish=11;
for i = 1:5

figure1=figure;
plot(evaluation_matrix(start:finish,1),evaluation_matrix(start:finish,4));
xlabel('dataset');
ylabel('error%');
start=start+11;
finish=finish+11;
title(['num neighbors ',num2str(i)]);
ylim manual;
ylim([0,4]);
saveas(figure1,['18_04/',num2str(i),'.png']);

end


% legend('no neighbors = 1','no neighbors = 2','no neighbors = 3','no neighbors = 4','no neighbors = 5')
