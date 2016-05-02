function [new_s_g,accepted_solution]=matchTree(s_n_s,s_n_e,s_g)
% write a recursive function
% s_g

[num_nodes,~]=size(s_g);
if(length((nonzeros(s_g(:))))==num_nodes)
    if(length(unique(nonzeros(s_g(:))))==num_nodes)
        new_s_g=s_g;
        return
    end
end

%new_s_g new sensor to grid matching matrix
%s any singular matrix found
%e any cell without a match found

[new_s_g,s,e]=candidates(s_n_s,s_n_e,s_g);
while(~isempty(s)&&isempty(e))
    [new_s_g,s,e]= candidates(s_n_s,s_n_e,new_s_g);
end
if ~isempty(e)
    return
end
if(length((nonzeros(new_s_g(:))))==num_nodes)
    %     s_g=new_s_g;
    if(length(unique(nonzeros(new_s_g(:))))==num_nodes)
        return
    end
end
single_ladies=[];

for i_single_ladies = 1:num_nodes
    if(length(nonzeros(new_s_g(i_single_ladies,:)))==1)
        single_ladies=[single_ladies,new_s_g(i_single_ladies,1)];
    end
end

% recursive code
% file='test.txt';
% fileID_local = fopen(file,'a');
% count=1;
if(length(nonzeros(new_s_g(:)))>num_nodes)
    for m_i=1:num_nodes-1
        possible_nodes=nonzeros(new_s_g(s_n_e(m_i),:) );
        len_pos_nodes=length(possible_nodes);
        if(length(possible_nodes)>1)
            for m_j=1:len_pos_nodes
                
                if(~isempty(intersect(single_ladies,possible_nodes(m_j))))
                    continue;
                end
                new_s_g(s_n_e(m_i),:)=0;
                new_s_g(s_n_e(m_i),1)=possible_nodes(m_j);
                new_s_g_dup= (matchTree(s_n_s,s_n_e,new_s_g));
                if(length((nonzeros(new_s_g_dup(:))))==num_nodes)
                    if(length(unique(nonzeros(new_s_g_dup(:))))==num_nodes)
                        if(length(unique(nonzeros(new_s_g_dup(:,1))))==num_nodes)
                            
                            %                         accepted_solution(count,:)=new_s_g_dup(:,1)';
%                             writter(new_s_g_dup(:,1)');
%                             new_s_g_dup(:,1)'
                            %                         count=count+1;
                            %                         return
                        end
                    end
                end
            end
        end
    end
    %  if(length((nonzeros(new_s_g(:))))==num_nodes)
    %     if(length(unique(nonzeros(new_s_g(:))))==num_nodes)
    %        new_s_g(1,:)'
    %         return
    %     end
    % end
%     fclose(fileID_local);
    
end


end
%-----------------------------%
function[func_new_s_g,func_s,func_e]=candidates(s_s,s_e,new_s_g)
func_s=[];
func_e=[];
func_new_s_g=filter_single_ladies(new_s_g);
[num_nodes,~]=size(new_s_g);
if(length(unique(nonzeros(func_new_s_g(:))))==num_nodes)
    
    return
end
a_m=...
    [0,1,1,zeros(1,5);...
    1,0,0,1,zeros(1,4);...
    1,0,0,1,1,0,0,0;...
    0,1,1,0,0,1,0,0;...
    0,0,1,0,0,1,1,0;...
    0,0,0,1,1,0,0,1;...
    0,0,0,0,1,0,0,1;...
    0,0,0,0,0,1,1,0];

% a_m=...
%     [0,1,1,zeros(1,5);...
%     1,0,0,1,zeros(1,4);...
%     1,0,0,1,1,0,0,0;...
%     0,1,1,0,0,1,0,0;...
%     0,0,0,0,1,0,0,1;...
%     0,0,0,0,0,1,1,0];
% a_m=[0,1,1,0,0,0;1,0,0,1,0,0;1,0,0,1,1,0;0,1,1,0,0,1;0,0,1,0,0,1;0,0,0,1,1,0];

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
    %     possible_values(:)
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
single_ladies=[];
[r,~]=size(new_s_g);
for i_single_ladies = 1:r
    if(length(nonzeros(new_s_g(i_single_ladies,:)))==1)
        single_ladies=[single_ladies,new_s_g(i_single_ladies,1)];
    end
end
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
