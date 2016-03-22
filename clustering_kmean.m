%% this script uses kmean clustering to classify the nodes using the
%correlation matrix obtained by correlating the energy matrix
% First step would be to remove the 1's for the same nodes it will
% mislead the kmean algorithm.
% clear
optimistic_neighbouring_map=...
    [ 0     1     1    -1     0     0     0     0;...
    1     0    -1     1     0     0     0     0;...
    1    -1     0     1     1    -1     0     0;...
    -1     1     1     0    -1     1     0     0;...
    0     0     1    -1     0     1     1    -1;...
    0     0    -1     1     1     0    -1     1;...
    0     0     0     0     1    -1     0     1;...
    0     0     0     0    -1     1     1     0];
optimistic_neighbouring_map=abs(optimistic_neighbouring_map);
newGraph=zeros(8,8);
count =1;
for i = 1:8
    for j = i+1:8
        correlation(count)=R(i,j);
        count = count + 1;
    end
end

[IDX,C]=kmeans(correlation',2);
if(C(2)>C(1))
    IDX=IDX-1;
else
    IDX=IDX-2;
    IDX=abs(IDX);
end
count = 1;
for i = 1:8
    for j = i+1:8
        newGraph(i,j)=IDX(count)-1;
        %           graphMatrix=abs(graphMatrix);
        count = count + 1;
    end
end


% for i = 1:8
%     for j = 1:8
graphMatrix=newGraph+newGraph';
falsepositive=0;
for i= 1:8
    for j = i+1:8
        if(optimistic_neighbouring_map(i,j)==0)
            if( optimistic_neighbouring_map(i,j)~=   graphMatrix(i,j));
                falsepositive=falsepositive+1;
            end
        end
    end
end
falseNegative=0;
for i= 1:8
    for j = i+1:8
        if(optimistic_neighbouring_map(i,j)==1)
            if( optimistic_neighbouring_map(i,j)~=   graphMatrix(i,j));
                falseNegative=falseNegative+1;
                
            end
        end
    end
end
te=falseNegative/16+falsepositive/12;
% G= graph(newGraph);
% plot(G);

