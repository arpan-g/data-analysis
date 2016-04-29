clear all;
n=8;
adjacency_matrix=[1,1,1,zeros(1,5);1,1,0,1,zeros(1,4);1,0,1,1,1,0,0,0;0,1,1,1,0,1,0,0;0,0,1,0,1,1,1,0;0,0,0,1,1,1,0,1;0,0,0,0,1,0,1,1;0,0,0,0,0,1,1,1];
for i = 1:n
adjacency_matrix(i,i)=0;
end
diag_elements=sum(adjacency_matrix);
for i = 1:n
l_m(i,i)=diag_elements(i);
end
l_m=l_m-adjacency_matrix;
j=round(rand*8);
l_m(j,:)=[];
l_m(:,j)=[];
num=det(l_m);