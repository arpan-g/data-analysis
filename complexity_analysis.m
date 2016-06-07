% a=getAdjacencyMatrix();
clear all;
a=[0,1,1,0,0,0;1,0,0,1,0,0;1,0,0,1,1,0;0,1,1,0,0,1;0,0,1,0,0,1;0,0,0,1,1,0];
[n,~]=size(a);
tree_graph=zeros(n,n);
a_s=[1 1 3 3 4];
b_s=[2 3 5 4 6];
% 1,6,2,5,4,3
% 1,3,2,5,4,6
% 1,2,3,4,5,6
% 2,5,1,6,3,4
% 2,4,1,6,3,5
% 2,1,4,3,6,5
% 3,5,1,6,2,4
% 3,1,5,2,6,4
% 4,6,2,5,1,3
% 4,2,6,1,5,3
% 5,6,3,4,1,2
% 5,3,6,1,4,2
% 5,2,6,1,4,3
% 6,5,4,3,2,1
% 6,4,5,2,3,1
% 6,1,5,2,3,4
% 1,2,3,5,4,6
% 1,2,3,4,5,6
% 2,1,4,6,3,5
% 2,1,4,3,6,5
% 3,1,4,6,2,5
% 3,5,4,2,6,1
% 4,2,3,5,1,6
% 4,6,3,1,5,2
% 5,6,3,4,1,2
% 5,6,3,1,4,2
% 6,5,4,3,2,1
% 6,5,4,2,3,1

% map=[4,3,2,5,1,6];
map=[1,2,3,4,5,6];
% map=[6,5,4,2,3,1];
for i = 1:n
    map_matrix(i,map(i))=1;
end
for i = 1:n-1
    new_tree_s(i)=map(a_s(i));
    new_tree_e(i)=map(b_s(i));
end


for i=1:n-1
    tree_graph(a_s(i),b_s(i))=1;
    tree_graph(b_s(i),a_s(i))=1;
end
b=tree_graph*a;
det(b)
%
% kirchoff_matrix=tree_graph*-1;
for i = 1:n
    Grid(i)=sum(a(i,:));
end
for i = 1:n
    Tree(i)=sum(tree_graph(i,:));
end
% G=graph(a);
m0=zeros(n,n);
for i=1:n
    for j =1:n
        if(Tree(j)>=Grid(i))
            m0(i,j)=1;
        end
    end
end

% 
% 
% L = laplacian(G);
% kirchoff_matrix(2,:)=[];
% kirchoff_matrix(:,2)=[];
% num_trees=det(kirchoff_matrix);