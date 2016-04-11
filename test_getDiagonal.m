refrence_matrix=[1,1,1,0.5,0,0,0,0; ...
    1,1,0.5,1,0,0,0,0; ...
    1,0.5,1,1,1,0.5,0,0; ...
    0.5,1,1,1,0.5,1,0,0; ...
    0,0,1,0.5,1,1,1,0.5; ...
    0,0,0.5,1,1,1,0.5,1; ...
    0,0,0,0,1,0.5,1,1; ...
    0,0,0,0,0.5,1,1,1];
zone = [1 2 3 4;
    3 4 5 6;
    5 6 7 8];
for kimi = 1:3
    i=1;j=1;
    a=getDiagonal(zone(kimi,:),R);
    for node_i = zone(kimi,:)
        j=1;
        for node_j = zone(kimi,:)
            
            if(a(i,j) == 0.5)
                new_adjacency_matrix(node_i,node_j)=0.5;
            end
            j=j+1;
        end
        i=i+1;
    end
end


% b=getDiagonal([3 4 5 6],R);
% c=getDiagonal([5 6 7 8],R);

fd=0;
diag=0;
for i = 1:8
    for j = i+1:8
        if(new_adjacency_matrix(i,j)==0.5)
            diag=diag+1;
            if(~(new_adjacency_matrix(i,j)==refrence_matrix(i,j)))
                fd=fd+1;
            end
        end
    end
end



