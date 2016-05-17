function[]=plot_tree(s,e)
n=numel(s);
full_matrix=zeros(n+1,n+1);
% w=zeros(1,n);
for i = 1:n
    full_matrix(s(i),e(i))=1;
  
    %     w(i)=R(s(i),e(i));
end

view(biograph(full_matrix));

end