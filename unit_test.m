clear all;
% 
% % a_s=[1 1 3 3 4];
% % b_s=[2 3 5 4 6];
% a_s=[1,1,3,2,4];
% b_s=[3,2,5,4,6];
% a_s=[1,3,5,6,4];
% b_s=[3,5,6,4,2];
a_s=[1 1 4 5 6 6 4 7];
b_s=[2 4 5 6 3 9 7 8];
% a_m=[0,1,1,0,0,0;1,0,0,1,0,0;1,0,0,1,1,0;0,1,1,0,0,1;0,0,1,0,0,1;0,0,0,1,1,0];
a_m=getAdjacencyMatrix;
% plot_tree(a_s,b_s);
for i = 1:9
map=zeros(9,1);
map(1,1)=i;
% profile on
matchTree(a_s,b_s,map,1,a_m);
end
% readFile
% profile viewer
% plot_tree(a_s,b_s);