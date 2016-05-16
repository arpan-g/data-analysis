clear all;

a_s=[1 1 3 3 4];
b_s=[2 3 5 4 6];
a_m=[0,1,1,0,0,0;1,0,0,1,0,0;1,0,0,1,1,0;0,1,1,0,0,1;0,0,1,0,0,1;0,0,0,1,1,0];
for i = 1:6
map=zeros(6,1);
map(1,1)=i;
% profile on
matchTree(a_s,b_s,map,1,a_m);
end
readFile
% profile viewer