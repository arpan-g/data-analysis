% adjaceny_matrix=[1,0,1,1,-1,-1,0,1;0,1,-1,0,0,1,1,0;...
%     1,-1,1,-1,0,1,1,0; 1,0,-1,1,1,1,0,-1; ...
%     -1,0,0,1,1,0,0,1;-1,1,1,1,0,1,-1,0;...
%     0,1,1,0,0,-1,1,0;1,0,0,-1,1,0,0,1];
% adjaceny_matrix = abs(adjaceny_matrix);
% R=R.*optimistic_neighbouring_map;
% identify the nodes with the same neighbors
adjaceny_matrix=double(graphMatrix);
[rows,columns]=size(adjaceny_matrix);
new_adjacency_matrix=adjaceny_matrix;
clear orders_var
% clear new_adjacency_matrix;
fd=0;
for i = 1:8
adjaceny_matrix(i,i)=1;
end

count = 1;
for i = 1:columns
    for j = i+1:columns
        
        if(sum(xor(adjaceny_matrix(:,i),adjaceny_matrix(:,j)))==0)
            % has 1's and 0's in the same position
            same_neighbors_list(count,:) = [i,j];
            count = count + 1;
            
        end
    end
end
if(count~=1)
    same_neighbors_list=unique(same_neighbors_list,'rows');
    [r,c]=size(same_neighbors_list);
%     orders=[1 2 3 4;
%         3, 4 , 5 , 6;
%         5,6,7,8];
    count_i=1;
    for i = 1:r
        for row_iterator = 1:r
            [corr_row,corr_column,v] = find(adjaceny_matrix(same_neighbors_list(i,1),:)==1);
            
            neighbors=setxor(corr_column,same_neighbors_list(i,:));
            zone=intersect(neighbors,same_neighbors_list(row_iterator,:));
            if(~isempty(zone)&&length(zone(:))>1)
                orders_var(count_i,:)=[same_neighbors_list(i,:),zone];
                count_i=count_i+1;
                
            end
        end
    end
   
%     orders
if(count_i>1)
%      orders_var
    [r_order,r_column]=size(orders_var);
    for ya_iterate=1:r_order
        %                 order=[same_neighbors_list(i,:),zone];
        order=orders_var(ya_iterate,:);
        a= getDiagonal(order,R);
        kimi = 1;
        for order_i = order
            arpan=1;
            for order_j = order
                if(a(kimi,arpan)==1.5)
                    new_adjacency_matrix(order_i,order_j)=  a(kimi,arpan);
                    
                end
                arpan=arpan+1;
            end
            %             new_adjacency_matrix
            kimi=kimi+1;
        end
        
        
        
        
    end
    %
    %
    %         end
    %     end
end
end



refrence_matrix=[1,1,1,0.5,0,0,0,0; ...
    1,1,0.5,1,0,0,0,0; ...
    1,0.5,1,1,1,0.5,0,0; ...
    0.5,1,1,1,0.5,1,0,0; ...
    0,0,1,0.5,1,1,1,0.5; ...
    0,0,0.5,1,1,1,0.5,1; ...
    0,0,0,0,1,0.5,1,1; ...
    0,0,0,0,0.5,1,1,1];

fd=0;diag_c=0;
for i = 1:8
    for j = i+1:8
        if(new_adjacency_matrix(i,j)==1.5)
            diag_c=diag_c+1;
            if(~(new_adjacency_matrix(i,j)==refrence_matrix(i,j)))
                fd=fd+1;
            end
        end
    end
end



G=graph(adjaceny_matrix,'OmitSelfLoops');
plot(G);
% new_adjacency_matrix
