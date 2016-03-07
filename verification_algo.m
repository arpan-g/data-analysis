%% This script is used to verify the sensor node topology.
%Create a sensor corresponding neighbors map.
neighbouring_map=zeros(8,8);
neighbouring_map=[1,1,1,zeros(1,5);1,1,0,1,zeros(1,4);1,0,1,1,1,0,0,0;0,1,1,1,0,1,0,0;0,0,1,0,1,1,1,0;0,0,0,1,1,1,0,1;0,0,0,0,1,0,1,1;0,0,0,0,0,1,1,1];
% neighbouring_map(1,1:2)=[2,3];
% neighbouring_map(2,1:2)=[1,4];
% neighbouring_map(3,1:3)=[1,4,5];
% neighbouring_map(4,1:3)=[2,3,6];
% neighbouring_map(5,1:3)=[3,7,6];
% neighbouring_map(6,1:3)=[4,5,8];
% neighbouring_map(7,1:2)=[5,8];
% neighbouring_map(8,1:2)=[6,7];
[rows,columns]=size(neighbouring_map);
for r = 1:rows
    count =1;
    for c = 1:columns
        if(neighbouring_map(r,c)~=0)
            
            collect_correlation(r,count)=R(r,neighbouring_map(r,c));
        else 
            collect_correlation(r,count)=1;
        end
        
        count = count+1;
    end
end

threshold=sort(collect_correlation(:));

for l =1:8
    for m =1:8  
        if(R(l,m)>=threshold(1))
        graphMatrix(l,m)=R(l,m);
        end
    end
    
end

figure1=figure;
G= graph(graphMatrix,'OmitSelfLoops');
plot(G);


%       s = [1 1 1 2 2 3 3 4 5 5 6 7];
%       t = [2 4 8 3 7 4 6 5 6 8 7 8];
%       weights = [10 10 1 10 1 10 1 1 12 12 12 12];
%       names = {'A' 'B' 'C' 'D' 'E' 'F' 'G' 'H'};
%       G = graph(s,t,weights,names)
%       G.Edges
%       G.Nodes
%       plot(G,'EdgeLabel',G.Edges.Weight)




