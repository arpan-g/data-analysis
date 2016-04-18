% adjacency_matrix=zeros(6,6);
a=[0	1	0	0	0	1	0	1	1; ...
    1	0	0	0	1	0	1	0	0; ...
    0	0	0	0	0	0	0	1	1; ...
    0	0	0	0	0	1	0	0	1; ...
    0	1	0	0	0	0	0	1	0; ...
    1	0	0	1	0	0	1	0	0; ...
    0	1	0	0	0	1	0	0	0; ...
    1	0	1	0	1	0	0	0	0; ...
    1	0	1	1	0	0	0	0	0
    ];
% [a,b]=fr_graph_viz(adjacency_matrix);
rows=3;
columns=3;
n=rows*columns;
% minimize for the distance
coordinates=zeros(rows*columns,2);
flag=zeros(n,1);
count = 1;
for row_i = 1:rows
    for column_i = 1:columns
        coordinates(count,:)=[row_i,column_i];
        count = count + 1;
    end
end

for node_iterator = 1:n
    
    edges = find(a(node_iterator,:));
    for edge_iterate = edges
        dist=distance_custom(coordinates(node_iterator,:),coordinates(edge_iterate,:));
        if(dist>1);
            flag(edge_iterate)=1;
        end
    end
    
end
