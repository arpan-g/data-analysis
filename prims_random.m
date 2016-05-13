function[node_s,node_e]= prims_random(distance_matrix,root,n)
%weighted matrix,root,number of nodes
count=1;
flag=1;
visited=zeros(n,1);
visited(root)=1;
for counter=1:n-1
    min = 999;
    for i = 1:n
        if(visited(i)==1)
            for j = 1:n
                if(visited(j)==0)
                    if(min>=distance_matrix(i,j))
                        u=i;
                        v=j;
                        min=distance_matrix(i,j);
                        if(min==1&&rand<0.6)
                            flag=1;
                            break;
                        end
                       
                        
                    end
                end
                
                
            end
            if(flag==1)
                flag=0;
                break;
            end
        end
    end
    node_s(counter)=u;
    node_e(counter)=v;
    visited(v)=1;
end
