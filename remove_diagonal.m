function[a_m]=remove_diagonal(graphMatrix,R)
adjaceny_matrix=double(graphMatrix);
[rows,columns]=size(adjaceny_matrix);
a_m=adjaceny_matrix;

for i = 1:rows
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
    for i = 1:r
        node=same_neighbors_list(i,:);
        rectangle_nodes=find(adjaceny_matrix(node(1),:)==1);
        a=zeros(2,2);
        if(length(rectangle_nodes)==4)
            a(1,:) = node;
            a(2,:) = setdiff(rectangle_nodes,node);
            alpha = R(a(1,1),a(2,1))+R(a(1,2),a(2,2));
            beta  = R(a(1,1),a(2,2))+R(a(1,2),a(2,1));
            
            if(alpha>beta)
                a_m(a(1,1),a(2,2))=0;
                a_m(a(2,2),a(1,1))=0;
                a_m(a(1,2),a(2,1))=0;
                a_m(a(2,1),a(1,2))=0;
            else
                a_m(a(1,1),a(2,1))=0;
                a_m(a(2,1),a(1,1))=0;
                a_m(a(1,2),a(2,2))=0;
                a_m(a(2,2),a(1,2))=0;
                
            end
        else
            first_neighbors=[];
            second_neighbors=[];
            b=setdiff(rectangle_nodes,node);
            for j = b
                if(b(1)~=j)
                    if(adjaceny_matrix(b(1),j)==1)
                        first_neighbors=[b(1),j];
                        second_neighbors=setdiff(b,first_neighbors);
                        break;
                    end
                end
            end
            if(~isempty( first_neighbors))
                a=[node;first_neighbors];
                alpha = R(a(1,1),a(2,1))+R(a(1,2),a(2,2));
                beta  = R(a(1,1),a(2,2))+R(a(1,2),a(2,1));
                
                if(alpha>beta)
                    a_m(a(1,1),a(2,2))=0;
                    a_m(a(2,2),a(1,1))=0;
                    a_m(a(1,2),a(2,1))=0;
                    a_m(a(2,1),a(1,2))=0;
                else
                    a_m(a(1,1),a(2,1))=0;
                    a_m(a(2,1),a(1,1))=0;
                    a_m(a(1,2),a(2,2))=0;
                    a_m(a(2,2),a(1,2))=0;
                    
                end
            end
            if(~isempty( second_neighbors)&&length(second_neighbors)==2)
                a=[node;second_neighbors];
                alpha = R(a(1,1),a(2,1))+R(a(1,2),a(2,2));
                beta  = R(a(1,1),a(2,2))+R(a(1,2),a(2,1));
                
                if(alpha>beta)
                    a_m(a(1,1),a(2,2))=0;
                    a_m(a(2,2),a(1,1))=0;
                    a_m(a(1,2),a(2,1))=0;
                    a_m(a(2,1),a(1,2))=0;
                else
                    a_m(a(1,1),a(2,1))=0;
                    a_m(a(2,1),a(1,1))=0;
                    a_m(a(1,2),a(2,2))=0;
                    a_m(a(2,2),a(1,2))=0;
                    
                end
                
            end
        end
        
        
        
    end
end

% new_adjacency_matrix
