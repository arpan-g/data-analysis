value =1;
emd1=emd(node1(value,:));
emd2=emd(node2(value,:));
emd3=emd(node3(value,:));
emd4=emd(node4(value,:));
emd5=emd(node5(value,:));
emd6=emd(node6(value,:));
emd7=emd(node7(value,:));
emd8=emd(node8(value,:));
for i = 1:11
    
  varr = corrcoef(emd3(i,1:6778),emd4(i,1:6778));
  coef(i)=varr(1,2)
end