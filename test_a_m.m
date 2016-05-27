% a_m=getAdjacencyMatrix();
for i = 1:numel(node_s)
    b(i)=areNeighbors(node_s(i),node_e(i),a_m);
end