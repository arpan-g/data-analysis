function[]=plot_tree(s,e)
n=numel(s);
full_matrix=zeros(n+1,n+1);
% w=zeros(1,n);
for i = 1:n
    full_matrix(s(i),e(i))=1;
  
    %     w(i)=R(s(i),e(i));
end
% ids={'S1','S2','S3','S4','S5','S6','S7','S8'};
% ids={'.','_',',','','*','/','.','`'};
% ids={'G4','G1','G3','G2','G6','G5','G8','G7'};
% bg1=biograph(full_matrix,ids,'Shape','circle');
view(biograph(full_matrix));

end