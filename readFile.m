file = 'test.txt';
fileID = fopen(file,'r');
% sizeA = [1641,8];
% A=fscanf(fileID,'%u,%u,%u,%u,%u,%u,%u,%u',sizeA);

 [c1, c2, c3, c4, c5, c6, c7, c8]=textread(file, '%u,%u,%u,%u,%u,%u,%u,%u', 'commentstyle', 'shell');
[r,c]=size(c1);
prevCombination=zeros(1,8);
count=1;
tree=zeros(1,8);
for i=1:r
    combination=[c1(i) c2(i) c3(i) c4(i) c5(i) c6(i) c7(i) c8(i)];
    if(~ismember( tree,combination,'rows'))
        tree(count,:)=combination;
        count=count+1;
    end
%     prevCombination=combination;
end