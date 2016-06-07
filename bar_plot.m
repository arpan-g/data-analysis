clear all;
name='ai_lab_58';
file=['C:\arpan\Thesis\data_analysis\data-analysis\WSU\',name,'.mat'];
load(file)
% index=[27,22,15,28,23,16,29,24,17,30,25,18];
figure1 =figure;
index=1:43;
imagesc(newPirArray);
% xlabel('time(x0.1s)');
% ylabel('sensor id');
% colorbar();

b=newPirArray;
a=sum(b')
error=min(a);

bar(a);
a=sum(b');
text(1:43,a',num2str(a','%d'),... 
'HorizontalAlignment','center',... 
'VerticalAlignment','bottom')
xlabel('sensor id');
ylabel('number of triggers');
saveas(figure1,['images\bar_',name,'.png']);
title(name);
saveas(figure1,['images\',name,'.png']);
% title('65')