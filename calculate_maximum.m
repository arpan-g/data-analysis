function [root,indices]=calculate_maximum(fun_R,k)
[r,c]=size(fun_R); 
    
for i = 1:r
    [values,indices]=sort(fun_R(i,:),'descend');
    indices_matrix(i,:)=indices(1:k);
    values_matrix(i,:)=values(1:k);
end
values_matrix=sum(values_matrix,2);
[value,index]=max(values_matrix);
indices=indices_matrix(index,:);
root=index;