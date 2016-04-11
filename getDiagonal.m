function [ adj_matrix ] = getDiagonal( zone_array,R )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
count_i=1;
ambiguity=zeros(1,4);
adj_matrix=[1 1 0 0 ; 1 1 0 0 ; 0 0 1 1 ; 0 0 1 1];

for node_i=zone_array
    
    count_j=1;
    for node_j=zone_array
        if(adj_matrix(count_i,count_j)~=1)
            correlation_matrix(count_i,count_j)=R(node_i,node_j);
            
        else
            correlation_matrix(count_i,count_j)=1;
        end
        count_j=count_j+1;
    end
    count_i=count_i+1;
end

for i = 1:4
    
    [val,index]=min(correlation_matrix(i,:));
    [val_check,index_check]= min(correlation_matrix(index,:));
    if(index_check==i)
        adj_matrix(index,i)=0.5;
        adj_matrix(i,index)= 0.5;
    else
        ambiguity(i)=1;
    end
end

for i = 1:4
    if(sum(ambiguity(:))<4)
        [corr_row,corr_column,v]=find(adj_matrix==0.5);
        rest_nodes=setdiff([1 2 3 4],[corr_row(1),corr_column(1)]);
        adj_matrix(rest_nodes(1),rest_nodes(2))=0.5;
        adj_matrix(rest_nodes(2),rest_nodes(1))=0.5;
    end
end
for i = 1:4
    if(sum(ambiguity(:))==4)
        [corr_row,corr_column,v]=find(adj_matrix==0.5);
        rest_nodes=setdiff([1 2 3 4],[corr_row(1),corr_column(1)]);
        adj_matrix(rest_nodes(1),rest_nodes(2))=0.5;
        adj_matrix(rest_nodes(2),rest_nodes(1))=0.5;
    end
end

end

