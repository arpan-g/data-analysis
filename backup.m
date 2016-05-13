function [new_s_g]=matchTree(s_n_s,s_n_e,s_g,edge_to_iterate)
% write a recursive function
% s_g


[num_nodes,~]=size(s_g);

a_m=getAdjacencyMatrix();
if(edge_to_iterate>num_nodes-1)
    new_s_g=s_g;
    
    return
end
if(iscomplete(s_g))
    new_s_g=s_g;
    return
end

%new_s_g new sensor to grid matching matrix
%s any singular matrix found
%e any cell without a match found

[new_s_g,s,e]=candidates(s_n_s,s_n_e,s_g,a_m);
% new_s_g
while(~isempty(s)&&isempty(e))
    [new_s_g,s,e]= candidates(s_n_s,s_n_e,new_s_g,a_m);
    %     new_s_g
end
if ~isempty(e)
    return
end
if(iscomplete(new_s_g))
    return
end

single_ladies=compute_single_ladies(new_s_g);
% recursive code

% if(length(nonzeros(new_s_g(:)))>num_nodes)
%     for m_i=1:num_nodes-1
m_i=edge_to_iterate;
possible_nodes=nonzeros(new_s_g(s_n_e(m_i),:) );
len_pos_nodes=length(possible_nodes);
%     if(length(possible_nodes)>1)
for m_j=1:len_pos_nodes
    
    %             if(~isempty(intersect(single_ladies,possible_nodes(m_j))))
    %                 continue;
    %             end
    if(~areNeighbors(new_s_g(s_n_s(m_i),1),possible_nodes(m_j),a_m))
        continue;
    end
    new_s_g(s_n_e(m_i),:)=0;
    
    new_s_g(s_n_e(m_i),1)=possible_nodes(m_j);
    single_ladies=compute_single_ladies(new_s_g);
    new_s_g_dup= matchTree(s_n_s,s_n_e,new_s_g,edge_to_iterate+1);
    
    if(iscomplete(new_s_g_dup)&&isValid(new_s_g_dup(:,1)',s_n_s,s_n_e,a_m))
        %                     accepted_solution(count,:)=new_s_g_dup(:,1)';
        writter(new_s_g_dup(:,1)');
        %                 new_s_g_dup(:,1)'
        %                     count=count+1;
        %                     return
    end
    
end
%     end
%     end


end


% end
%-----------------------------%
function[func_new_s_g,func_s,func_e]=candidates(s_s,s_e,new_s_g,a_m)
func_s=[];
func_e=[];
func_new_s_g=filter_single_ladies(new_s_g);
[num_nodes,~]=size(new_s_g);
if(iscomplete(func_new_s_g))
    
    return
end


num_tree_nodes=length(s_s);
for i = 1:num_tree_nodes
    if(length(nonzeros(func_new_s_g(i,:)))==1)
        %     a_m(i,:)=0;
        a_m(:,func_new_s_g(i,1))=0;
    end
end

for i = 1: num_tree_nodes
    %get mapings of the start node
    non_zero_values= nonzeros(func_new_s_g(s_s(i),:));
    possible_values=[];
    %if end node is already assigned to a node
    if(length(nonzeros(func_new_s_g(s_e(i),:)))==1)
        continue;
    end
    if(~isempty(non_zero_values))
        for j = 1:length(non_zero_values)
            [~,c,~]=find(a_m(non_zero_values(j),:));
            possible_values=union(possible_values,c);
        end
    end
    
    if(isempty(possible_values))
        func_e=s_e(i);
        return
        
    elseif(length(possible_values)==1)
        func_s=possible_values;
        a_m(:,possible_values)=0;
    end
    length_possible_values=length(possible_values);
    func_new_s_g(s_e(i),:)=[possible_values(:)',zeros(1,num_nodes-length_possible_values)];
    if(length(possible_values)==1)
        for k = 1:num_nodes
            if(k~=s_e(i))
                [~,d_c,~]=find(func_new_s_g(k,:)==possible_values);
                if(~isempty(d_c))
                    func_new_s_g(k,d_c)=0;
                    after_delete=nonzeros(func_new_s_g(k,:));
                    if(isempty(after_delete))
                        func_e=k;
                    end
                    func_new_s_g(k,:)=[after_delete(:)',zeros(1,num_nodes-length(after_delete))];
                end
            end
        end
    end
    
    
    
end

end
function [new_s_g]=filter_single_ladies(new_s_g)
single_ladies=compute_single_ladies(new_s_g);
[r,~]=size(new_s_g);

for i_filter = 1:r
    temp=nonzeros(new_s_g(i_filter,:));
    if(length(temp)==1)
        continue
    end
    common_elements=intersect(temp,single_ladies);
    if(~isempty(common_elements ))
        for common_iterator = 1:length(common_elements)
            [~,c_,~]=find(new_s_g(i_filter,:)==common_elements(common_iterator));
            new_s_g(i_filter,c_)=0;
        end
        after_delete= nonzeros(new_s_g(i_filter,:));
        new_s_g(i_filter,:)= [after_delete(:)',zeros(1,r-length(after_delete))];
    end
end
end

function [single_nodes]=compute_single_ladies(sensor2grid_map)
single_nodes=[];
[num_nodes,~]=size(sensor2grid_map);
for i_iterate = 1:num_nodes
    if(length(nonzeros(sensor2grid_map(i_iterate,:)))==1)
        
        single_nodes=[single_nodes,sensor2grid_map(i_iterate,1)];
        
    end
end
single_nodes=unique(single_nodes);

end

function [bool] =iscomplete(s_g)
[~,num_nodes]=size(s_g);
bool=0;
if(length((nonzeros(s_g(:))))==num_nodes)
    if(length(unique(nonzeros(s_g(:))))==num_nodes)
        if(length(unique(nonzeros(s_g(:,1))))==num_nodes)
            bool=1;
        end
    end
end
end

function [bool]=isValid(s_g,s_s,s_e,a_m)
bool=1;
for i = 1:length(s_s)
    
    grid_tree_mapping_s(i)=s_g(s_s(i));
    grid_tree_mapping_e(i)=s_g(s_e(i));
    
end

for i = 1:length(s_s)
    if(a_m(grid_tree_mapping_s(i),grid_tree_mapping_e(i))~=1)
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
