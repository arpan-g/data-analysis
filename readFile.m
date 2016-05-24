file = 'test.txt';
fileID = fopen(file,'r');
% sizeA = [1641,8];
% A=fscanf(fileID,'%u,%u,%u,%u,%u,%u,%u,%u',sizeA);

%  [c1, c2, c3, c4, c5, c6, c7, c8,c9,c10,c11,c12]=textread(file, '%u,%u,%u,%u,%u,%u,%u,%u,%u,%u,%u,%u', 'commentstyle', 'shell');
%  [c1, c2, c3, c4, c5, c6, c7, c8,c9,c10,c11,c12,c13,c14,c15,c16]=textread(file, '%u,%u,%u,%u,%u,%u,%u,%u,%u,%u,%u,%u,%u,%u,%u,%u', 'commentstyle', 'shell');
% [c1, c2, c3, c4, c5, c6, c7, c8,c9,c10,c11,c12,c13,c14,c15,c16,c17,c18,c19,c20,c21,c22,c23]=textread(file, '%u,%u,%u,%u,%u,%u,%u,%u,%u,%u,%u,%u,%u,%u,%u,%u,%u,%u,%u,%u,%u,%u,%u', 'commentstyle', 'shell');
% [c1, c2, c3, c4, c5, c6, c7, c8,c9,c10,c11,c12,c13,c14,c15,c16,c17,c18,c19,c20,c21,c22,c23,c24,c25,c26,c27,c28,c29,c30]=textread(file, '%u,%u,%u,%u,%u,%u,%u,%u,%u,%u,%u,%u,%u,%u,%u,%u,%u,%u,%u,%u,%u,%u,%u,%u,%u,%u,%u,%u,%u,%u', 'commentstyle', 'shell');
% [c1, c2, c3, c4, c5, c6, c7, c8,c9,c10,c11,c12,c13,c14,c15,c16,c17,c18,c19,c20,c21,c22,c23,c24,c25,c26,c27,c28,c29,c30,c31,c32,c33,c34,c35,c36 c37,c38,c39,c40,c41,c42,c43]=textread(file, '%u,%u,%u,%u,%u,%u,%u,%u,%u,%u,%u,%u,%u,%u,%u,%u,%u,%u,%u,%u,%u,%u,%u,%u,%u,%u,%u,%u,%u,%u,%u,%u,%u,%u,%u,%u,%u,%u,%u,%u,%u,%u,%u', 'commentstyle', 'shell');
%  [c1, c2, c3, c4, c5, c6]=textread(file, '%u,%u,%u,%u,%u,%u', 'commentstyle', 'shell');
[c1, c2, c3, c4, c5, c6, c7, c8]=textread(file, '%u,%u,%u,%u,%u,%u,%u,%u', 'commentstyle', 'shell');
% [r,c]=size(c1);
% prevCombination=zeros(1,12);
% count=1;
% tree=zeros(1,8);
% tree=zeros(1,12);
% tree=zeros(1,16);
% tree=zeros(1,23);
% tree=zeros(1,30);
% tree=zeros(1,36);
% tree=zeros(1,43);
% for i=1:r
    tree=[c1 c2 c3 c4 c5 c6 c7 c8];
%     combination=[c1(i) c2(i) c3(i) c4(i) c5(i) c6(i) c7(i) c8(i) c9(i) c10(i) c11(i) c12(i) c13(i) c14(i) c15(i) c16(i)];
%     combination=[c1(i) c2(i) c3(i) c4(i) c5(i) c6(i) c7(i) c8(i) c9(i) c10(i) c11(i) c12(i) c13(i) c14(i) c15(i) c16(i) c17(i) c18(i) c19(i) c20(i) c21(i) c22(i) c23(i) ];
% combination=[c1(i) c2(i) c3(i) c4(i) c5(i) c6(i) c7(i) c8(i) c9(i) c10(i) c11(i) c12(i) c13(i) c14(i) c15(i) c16(i) c17(i) c18(i) c19(i) c20(i) c21(i) c22(i) c23(i) c24(i) c25(i) c26(i) c27(i) c28(i) c29(i) c30(i) c31(i) c32(i) c33(i) c34(i) c35(i) c36(i) ];
% tree=[c1 c2 c3 c4 c5 c6 c7 c8 c9 c10 c11 c12 c13 c14 c15 c16 c17 c18 c19 c20 c21 c22 c23 c24 c25 c26 c27 c28 c29 c30 c31 c32 c33 c34 c35 c36 c37 c38 c39 c40 c41 c42 c43 ];
%         combination=[c1(i) c2(i) c3(i) c4(i) c5(i) c6(i) c7(i) c8(i) c9(i) c10(i) c11(i) c12(i)];
%      combination=[c1(i) c2(i) c3(i) c4(i) c5(i) c6(i)];
%     if(~ismember( tree,combination,'rows'))
%         tree(count,:)=combination;
%         count=count+1;
%     end
%     prevCombination=combination;
% end