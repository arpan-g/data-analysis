
clear all;

num_rows=4;
num_cols=2;
n=num_rows*num_cols;
count = 1;
sensor_cordinates=zeros(n,2);
weights=[];
list1=[];
list2=[];
root=1;
optimistic_neighbouring_map=[ 1     1     1     -1     0     0     0     0; 1     1     -1     1     0     0     0     0;    1     -1     1     1     1     -1     0     0;    -1     1     1     1     -1     1     0     0;    0     0     1     -1     1     1     1     -1;    0     0     -1     1     1     1     -1     1;    0     0     0     0     1     -1     1     1;    0     0     0     0     -1     1     1     1];
optimistic_neighbouring_map=abs(optimistic_neighbouring_map);
for i = 1:num_rows
    for j = 1:num_cols
        sensor_cordinates(count,:)=[i,j];
        count= count + 1;
    end
end

distance_measure=zeros(n);
for i = 1:n
    for j = 1:n
        distance_measure(i,j)=distance_euclidean(sensor_cordinates(i,:),sensor_cordinates(j,:));
    end
end
count=root;
edge_count=1;
nodes_covered=root;
nodes=1:n;
for i = 1:n
    distance_measure(i,i)=n;
end
while(~isequal(nodes,nodes_covered))
    min_value=min(distance_measure(count,:));
    [corr_row,corr_colum,v] = find(distance_measure(count,:)==min_value);
    len=length(corr_colum);
    index=round(rand*len);
    if(index>0)
        if(isempty( intersect(corr_colum(index),nodes_covered)))
            edge(edge_count,:)=[count,corr_colum(index)];
            edge_count=edge_count+1;
            nodes_covered=[nodes_covered,corr_colum(index)];
            count=count+1;
        end
        
    end
    
end

