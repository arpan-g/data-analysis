figure1 = figure;
value =7;
% emd1=emd(node1(value,:));
% emd2=emd(node2(value,:));
% emd3=emd(node3(value,:));
% emd4=emd(node4(value,:));
% emd5=emd(node5(value,:));
% emd6=emd(node6(value,:));
% emd7=emd(node7(value,:));
% emd8=emd(node8(value,:));
% value  is the IMF's
% for value = 1:7
emdArray=[emd1(value,1:6778);emd2(value,1:6778);emd3(value,1:6778);emd4(value,1:6778);emd5(value,1:6778);emd6(value,1:6778);emd7(value,1:6778);emd8(value,1:6778)];
node_id = 8;
% i is the nodes
     for i = 1:8
        
        varr = corrcoef(emdArray(node_id,1:6778),emdArray(i,1:6778));
        coef(i)=varr(1,2);
   end
% end
plot(coef);xlabel('nodeID'),ylabel('corr');title('node8');
saveas(figure1,'node_mem_8.png')
% legend('1','2','3','4','5','6','7','8')
% legend('1','2','3','4','5','6','7','8','9','10');