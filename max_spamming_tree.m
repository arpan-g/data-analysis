%% maximum spanning tree
% create a sparse matrix
n=8;
list1=[];
list2=[];
weights=[];

for i = 1:n
R(i,i)=0;
end
for i = 1:n
    [rows,col,v]=find(R(i,:));
    k = length(v);
    weights=[weights,v*-1];
    list1=[list1,ones(1,k)*i];
    list2=[list2,col];
%     neighbor_matrix(i,:)=indices(1:k);
end
% graphminspantree(R);
DG=sparse(list1,list2,weights);
UG = tril(DG + DG');
% figure
view(biograph(UG,[],'ShowArrows','off','ShowWeights','off'));
[ST,pred] = graphminspantree(UG,2,'Method','Kruskal');
% figure
view(biograph(ST,[],'ShowArrows','off','ShowWeights','off'));