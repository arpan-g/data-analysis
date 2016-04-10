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
fd=0;

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
    [r,c]=size(same_neighbors_list);
    for i = 1:r
        num_neighbors = sum(adjaceny_matrix(same_neighbors_list(i,1),:));
        [corr_row,corr_column,v] = find(adjaceny_matrix(same_neighbors_list(i,1),:)==1);
        
        neighbors=setxor(corr_column,same_neighbors_list(i,:));
        if(num_neighbors==4)
            
            for j = 1:2
                index=same_neighbors_list(i,j);
                diff=R(index,neighbors(1))-R(index,neighbors(2));
%                 if(abs(diff)>0.02)
                    if(diff>0)
                        new_adjacency_matrix(index,neighbors(2))=diff;
%                         new_adjacency_matrix(neighbors(2),index)=diff;
                    else
                        new_adjacency_matrix(index,neighbors(1))=diff;
%                         new_adjacency_matrix(neighbors(1),index)=diff;
                    end
                end
%             end
            
            j=1;
        elseif (num_neighbors==6)
            for row_iterator = 1:r
                zone=intersect(neighbors,same_neighbors_list(row_iterator,:));
                if(~isempty(zone)&&length(zone(:))>1)
                    for j = 1:2
                        index=same_neighbors_list(i,j);
                        %                     zone
                        diff=R(index,zone(1))-R(index,zone(2));
%                         if(abs(diff)>0.02)
                            if(diff>0)
                                new_adjacency_matrix(index,zone(2))=diff;
%                                 new_adjacency_matrix(zone(2),index)=diff;
                            else
                                new_adjacency_matrix(index,zone(1))=diff;
%                                 new_adjacency_matrix(zone(1),index)=diff;
                            end
%                         end
                    end
                end
                
            end
            
        end
        
    end
%     squares=[1 2  3 4; 3 4 5 6 ; 5 6 7 8];
%     for square_iterator = 1:3
%         square = squares(square_iterator,:);
%         for node_iterator = square
%             for yai = square
%                 if(new_adjacency_matrix(node_iterator,yai)
%             end
%         end
    
    refrence_matrix=[1,1,1,0.5,0,0,0,0; ...
        1,1,0.5,1,0,0,0,0; ...
        1,0.5,1,1,1,0.5,0,0; ...
        0.5,1,1,1,0.5,1,0,0; ...
        0,0,1,0.5,1,1,1,0.5; ...
        0,0,0.5,1,1,1,0.5,1; ...
        0,0,0,0,1,0.5,1,1; ...
        0,0,0,0,0.5,1,1,1];
    
    fd=0;
%     for i = 1:8
%         for j = i+1:8
%             if(new_adjacency_matrix(i,j)==0.5)
%                 if(~(new_adjacency_matrix(i,j)==refrence_matrix(i,j)))
%                     fd=fd+1;
%                 end
%             end
%         end
%     end
%     
end

% G=graph(adjaceny_matrix,'OmitSelfLoops');
% plot(G);
new_adjacency_matrix
