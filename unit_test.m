clear all;

a_s=[1 1 3 3 4];
b_s=[2 3 5 4 6];
for i = 1:6
map=zeros(6,6);
map(1,1)=i;
% profile on
matchTree(a_s,b_s,map,1);
end
readFile
% profile viewer