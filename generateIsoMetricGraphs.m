function[g_s,g_e]= generateIsoMetricGraphs(node_s,node_e,g_root,n)
a_m=...
    [0,1,1,zeros(1,5);...
    1,0,0,1,zeros(1,4);...
    1,0,0,1,1,0,0,0;...
    0,1,1,0,0,1,0,0;...
    0,0,1,0,0,1,1,0;...
    0,0,0,1,1,0,0,1;...
    0,0,0,0,1,0,0,1;...
    0,0,0,0,0,1,1,0];
len=length(node_s);
s_root=node_s(1);
g_probability_matrix=ones(n,1);
g_probability_distribution=zeros(n,n);%sensors-x(row) grid |y(col)

g_neighboring_matrix=sum(a_m);
%map sensor nodes in node_s and node_e to the grid
%index is the sensor node value is the grid node.
s_g_mapping=zeros(n,1);
s_g_mapping(s_root)=g_root;
unique_nodes=unique(node_s);
%end nodes of root
g_node=g_root;
node_visited=[];
for i = unique_nodes
    if(isempty(node_visited,i))
        [sen_nodes,num_sensors]=getEndNodes(i,node_s,node_e);
        [g_neighbors,num_grid]= getGridNeighbors(g_node,a_m);
        for j = g_neighbors
            for k = sen_nodes
                prob=g_probability_matrix(j)/num_sensors;
                g_probability_distribution(k,j)=prob;
                g_probability_matrix(j)=g_probability_matrix(j)-prob;
            end
        end
    end
    node_visited=[node_visited,i];
end
g_probability_matrix













end
%-------------------------------------------------------------------------%
function[end_nodes,num_nodes]=getEndNodes(node,start_node_list,end_node_list)
indices=find(start_node_list==node);
num_nodes=length(indices);
end_nodes=end_node_list(indices);
end
%-------------------------------------------------------------------------%

function[neighbors,num_nodes]=getGridNeighbors(node,adjacency_matrix)
neighbors=find(adjacency_matrix(node,:));
num_nodes=length(neighbors);
end


