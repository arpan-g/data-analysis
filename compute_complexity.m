function[complexity]=compute_complexity(a_m)
complexity=0;
[num_nodes,~]=size(a_m);
neighbors_matrix=zeros(num_nodes,1);
for i = 1:num_nodes
    len=numel(nonzeros(a_m(i,:)));
    neighbors_matrix(len)=neighbors_matrix(len)+1;
end

for i = 1:num_nodes
    if(neighbors_matrix(i)>1)
        complexity= complexity+(i-1)^neighbors_matrix(i);
    end
end



end