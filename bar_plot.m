clear all;
name='ai_lab_76';
file=['C:\arpan\Thesis\data_analysis\data-analysis\WSU\',name,'.mat'];
load(file)
% index=[27,22,15,28,23,16,29,24,17,30,25,18];
figure1 =figure;
index=1:43;
imagesc(newPirArray);
% saveas(figure1,['images\hm_',name,'.png']);
b=newPirArray(index,:);
a=sum(b');
min(a)
% 
bar(a);
text(1:43,a',num2str(a','%d'),... 
'HorizontalAlignment','center',... 
'VerticalAlignment','bottom')
xlabel('sensor id');
ylabel('number of triggers');
title(name);
% saveas(figure1,['images\',name,'.png']);
% title('65')