function []=matchTree(s_n_s,s_n_e,s_g,edge_to_iterate,a_m)
% write a recursive function
% s_g


num_nodes=numel(s_g);
new_s_g=s_g;



edge_node=s_n_e(edge_to_iterate);
if(edge_to_iterate< num_nodes-2)
    % calculate degree of the node 
    edge_node_num_leaf_nodes=numel(find(s_n_s(edge_to_iterate+1:end)==edge_node));
else
    edge_node_num_leaf_nodes=0;
end
possible_nodes=calculate_possible_nodes(new_s_g(s_n_s(edge_to_iterate)),new_s_g,a_m,edge_node_num_leaf_nodes);
len_pos_nodes=numel(possible_nodes);
if(len_pos_nodes==0)
    
    return
end


index=s_n_e(edge_to_iterate);
for m_j=1:len_pos_nodes
    
    
    new_s_g(index)=possible_nodes(m_j);
    
    if(edge_to_iterate<num_nodes-1)
        matchTree(s_n_s,s_n_e,new_s_g,edge_to_iterate+1,a_m);
    end
    new_s_g_dup=new_s_g;
    
    if(iscomplete(new_s_g_dup)&&isValid(new_s_g_dup',s_n_s,s_n_e,a_m))
        %         new_s_g_dup'
        writter(new_s_g_dup');
        
    end
    
end



end



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



function [unique_ele] =unique_custom(s_g)
unique_ele = s_g([true;diff(s_g(:))>0]);
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

end



