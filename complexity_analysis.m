% a=getAdjacencyMatrix();
a=[0,1,1,0,0,0;1,0,0,1,0,0;1,0,0,1,1,0;0,1,1,0,0,1;0,0,1,0,0,1;0,0,0,1,1,0];
[n,~]=size(a);
tree_graph=zeros(n,n);
for i=1:n-1
    tree_graph(a_s(i),b_s(i))=1;
    tree_graph(b_s(i),a_s(i))=1;
end
kirchoff_matrix=tree_graph*-1;
for i = 1:n
    kirchoff_matrix(i,i)=sum(tree_graph(i,:));    
end
G=graph(a);



L = laplacian(G);
kirchoff_matrix(2,:)=[];
kirchoff_matrix(:,2)=[];
num_trees=det(kirchoff_matrix);