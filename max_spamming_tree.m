%% maximum spanning tree
% create a sparse matrix
clear all;
power_consumption
n=8;
list1=[];
list2=[];
weights=[];
% grid dimension
Nrow=4;
Ncol=2;
root=7;


for i = 1:n
R(i,i)=0;
end
for i = 1:n
    [rows,col,v]=find(R(i,:));
    k = length(v);
    weights=[weights,(v*-1)];
    list1=[list1,ones(1,k)*i];
    list2=[list2,col];
%     neighbor_matrix(i,:)=indices(1:k);
end
% graphminspantree(R);
DG=sparse(list1,list2,weights);
UG = tril(DG + DG');
% figure
% view(biograph(UG,[],'ShowArrows','off','ShowWeights','off'));
[ST,pred] = graphminspantree(UG,root,'Method','Kruskal');
% figure
view(biograph(ST,[],'ShowArrows','off','ShowWeights','off'));
[i,j,s]=find(ST);
fileID_local = fopen('C:\Users\310225961\workspace\DetermineLayout\edgeList.txt','w');
len=length(i);
for kimi = 1:len
    fprintf(fileID_local,'%1d,%1d\n',j(kimi),i(kimi));
end
fclose(fileID_local);



% cordinates=create_coordinates(Nrow,Ncol);
% len = length(i);
% node=root;
% node_cordinates=zeros(Nrow*Ncol,2);
% node_coordinates(root,:)=[1,1];
% covered_nodes=[];
% for i_iterator=1:len
%       [node_i,node_j,node_s]= find(j==node);
%       for j_iterator = node_j
%           if(~isempty( covered_nodes))
%           if(size(intersect(covered_nodes,j_iterator))==1)
%               continue;
%           end
%           end
%           random_number=rand;
%           if(random_number<0.25)
%             node_coordinates(j_iterator,:)=  [node_coordinates(node,1)+1,node_coordinates(node,1)];
%           elseif (random_number>=0.25&&random_number<0.5)
%               node_coordinates(j_iterator,:)=  [node_coordinates(node,1),node_coordinates(node,1)+1];
%           elseif(random_number>=0.5&&random_number<0.75)
%               node_coordinates(j_iterator,:)=  [node_coordinates(node,1)-1,node_coordinates(node,1)];
%           else 
%               node_coordinates(j_iterator,:)=  [node_coordinates(node,1),node_coordinates(node,1)-1];
%           end
%              covered_nodes=[covered_nodes,node]; 
%       end
%       % update node
%       
%       
% end



% rand


