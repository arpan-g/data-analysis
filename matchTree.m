function []=matchTree(s_n_s,s_n_e,s_g,edge_to_iterate,a_m)
% write a recursive function
% s_g


num_nodes=numel(s_g);
new_s_g=s_g;

if(iscomplete(s_g))
    %     new_s_g=s_g;
    return
end

%new_s_g new sensor to grid matching matrix
%s any singular matrix found
%e any cell without a match found

% recursive code

edge_node=s_n_e(edge_to_iterate);
if(edge_to_iterate< num_nodes-2)
    edge_node_num_leaf_nodes=numel(find(s_n_s(edge_to_iterate+1:end)==edge_node));
else
    edge_node_num_leaf_nodes=0;
end
possible_nodes=calculate_possible_nodes(new_s_g(s_n_s(edge_to_iterate)),new_s_g,a_m,edge_node_num_leaf_nodes);
len_pos_nodes=numel(possible_nodes);
if(len_pos_nodes==0)
    
    return
end

%     if(length(possible_nodes)>1)
for m_j=1:len_pos_nodes
    
    
    new_s_g(s_n_e(edge_to_iterate))=possible_nodes(m_j);
    
    if(edge_to_iterate<num_nodes)
        matchTree(s_n_s,s_n_e,new_s_g,edge_to_iterate+1,a_m);
    end
    new_s_g_dup=new_s_g;
    
    if(iscomplete(new_s_g_dup)&&isValid(new_s_g_dup',s_n_s,s_n_e,a_m))
        %         new_s_g_dup'
        writter(new_s_g_dup');
        
    end
    
end



end


% end
%-----------------------------%






function [bool] =iscomplete(s_g)
num_nodes=numel(s_g);
bool=0;
sort_array=sort(nonzeros(s_g(:)));

if(numel(unique_custom(sort_array))==num_nodes)
    
    bool=1;
    
end
end

function [bool]=isValid(s_g,s_s,s_e,a_m)
bool=1;
length_s_s=numel(s_s);
for i = 1:length_s_s
    
    if(a_m(s_g(s_s(i)),s_g(s_e(i)))~=1)
        bool=0;
        return
    end
end
end

function[bool]=areNeighbors(nodeA,nodeB,a_m)
bool=0;
if(nodeA==0||nodeB==0)
    return;
end
bool=a_m(nodeA,nodeB);

end

function [unique_ele] =unique_custom(s_g)
unique_ele = s_g([true;diff(s_g(:))>0]);
end

function [union_ele] =union_custom(a,b)
combine=[a,b];
sort_combine=sort(combine);
union_ele=unique_custom(sort_combine);

end

function [possible_nodes]=calculate_possible_nodes(start_edge,taken_nodes,a_m,num_leaf_nodes)
local_a_m=a_m;
possible_nodes=[];
local_a_m(:,nonzeros(taken_nodes))=0;
first_possible_nodes=find(local_a_m(start_edge,:));
for i = first_possible_nodes
    if(numel(nonzeros(local_a_m(i,:)))>=num_leaf_nodes)
        possible_nodes=[possible_nodes,i];
    end
end
% possible_nodes=setdiff(first_possible_nodes,taken_nodes);
% possible_nodeso
end

