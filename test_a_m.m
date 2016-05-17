a_m=getAdjacencyMatrix();
for i = 1:42
    b(i)=areNeighbors(node_s(i),node_e(i),a_m);
end