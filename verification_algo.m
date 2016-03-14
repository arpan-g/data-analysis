%% This script is used to verify the sensor node topology.
%Create a sensor corresponding neighbors map.
% clearvars -except R;
close all;
te=3;
minTe=1000;
neighbouring_map=zeros(8,8);
neighbouring_map=[1,1,1,zeros(1,5);1,1,0,1,zeros(1,4);1,0,1,1,1,0,0,0;0,1,1,1,0,1,0,0;0,0,1,0,1,1,1,0;0,0,0,1,1,1,0,1;0,0,0,0,1,0,1,1;0,0,0,0,0,1,1,1];

optimistic_neighbouring_map=[ 1     1     1     -1     0     0     0     0;    1     1     -1     1     0     0     0     0;    1     -1     1     1     1     -1     0     0;    -1     1     1     1     -1     1     0     0;    0     0     1     -1     1     1     1     -1;    0     0     -1     1     1     1     -1     1;    0     0     0     0     1     -1     1     1;    0     0     0     0     -1     1     1     1];
bestThreshold=0;

[rows,columns]=size(neighbouring_map);
for r = 1:rows
    count =1;
    for c = 1:columns
        if(neighbouring_map(r,c)~=0)
            
            collect_correlation(r,c)=R(r,c);
        else
            collect_correlation(r,c)=1;
        end
        
        count = count+1;
    end
end
correlation_sorted=sort(R(:));
threshold_array=sort(collect_correlation(:));
[corr_row,corr_colum,v] = find(correlation_sorted==threshold_array(1));
index=corr_row(end)-1;
[r,c]=size(correlation_sorted);
while(te >= 2 && index<r)
     graphMatrix=zeros(8,8);
    index = index+1;
threshold=correlation_sorted(index);
for l =1:8
%     row_threshold = min(collect_correlation(l,:));
    for m =1:8
        graphMatrix(l,m)=(R(l,m)>=threshold);
    end
    
end


for i= 1:8
    for j = 1:8
        graphMatrix(i,j)=   graphMatrix(i,j) & graphMatrix(j,i);
    end
end
count=1;
flag=0;
for i= 1:8
    for j = 1:8
        if(neighbouring_map(i,j)==1)
            if( neighbouring_map(i,j)~=   graphMatrix(i,j));
                nonMatchingMatrix(count,1)=i;
                nonMatchingMatrix(count,2)=j;
                count=count+1;
                flag=1;
                %                 break;
            end
        end
    end
end
falsepositive=0;
for i= 1:8
    for j = 1:8
        if(optimistic_neighbouring_map(i,j)==0)
            if( optimistic_neighbouring_map(i,j)~=   graphMatrix(i,j));
                fpMatrix(falsepositive+1,1)=i;
                fpMatrix(falsepositive+1,2)=j;
                falsepositive=falsepositive+1;
                
            end
        end
    end
end
falseNegative=0;
for i= 1:8
    for j = 1:8
        if(optimistic_neighbouring_map(i,j)==1)
            if( optimistic_neighbouring_map(i,j)~=   graphMatrix(i,j));
                fnMatrix(count,1)=i;
                fnMatrix(count,2)=j;
                falseNegative=falseNegative+1;
                
            end
        end
    end
end

if(falseNegative+falsepositive<minTe)
bestThreshold = max(bestThreshold,threshold);
if(flag==1)
    disp('neighbours not matching')
    nonMatchingMatrix
end
end

minTe=min(falseNegative+falsepositive,minTe);
te=falseNegative+falsepositive;
if(te==0)
    break;
end
end
clear graphMatrix;
for l =1:8
%     row_threshold = min(collect_correlation(l,:));
    for m =1:8
        graphMatrix(l,m)=(R(l,m)>=bestThreshold);
    end
    
end
for i= 1:8
    for j = 1:8
        graphMatrix(i,j)=   graphMatrix(i,j) & graphMatrix(j,i);
    end
end
count=1;
flag=0;
for i= 1:8
    for j = 1:8
        if(neighbouring_map(i,j)==1)
            if( neighbouring_map(i,j)~=   graphMatrix(i,j));
%                 nonMatchingMatrix(count,1)=i;
%                 nonMatchingMatrix(count,2)=j;
%                 count=count+1;
                flag=1;
                %                 break;
            end
        end
    end
end
falsepositive=0;
for i= 1:8
    for j = 1:8
        if(optimistic_neighbouring_map(i,j)==0)
            if( optimistic_neighbouring_map(i,j)~=   graphMatrix(i,j));
                fpMatrix(falsepositive+1,1)=i;
                fpMatrix(falsepositive+1,2)=j;
                falsepositive=falsepositive+1;
                
            end
        end
    end
end
falseNegative=0;
for i= 1:8
    for j = 1:8
        if(optimistic_neighbouring_map(i,j)==1)
            if( optimistic_neighbouring_map(i,j)~=   graphMatrix(i,j));
                fnMatrix(count,1)=i;
                fnMatrix(count,2)=j;
                falseNegative=falseNegative+1;
                
            end
        end
    end
end


if(flag==1)
    disp('neighbours not matching')
    nonMatchingMatrix
end

te=falseNegative+falsepositive;

figure1=figure;
G= graph(graphMatrix,'OmitSelfLoops');
plot(G);
saveas(figure1,ver_file)
%       s = [1 1 1 2 2 3 3 4 5 5 6 7];
%       t = [2 4 8 3 7 4 6 5 6 8 7 8];
%       weights = [10 10 1 10 1 10 1 1 12 12 12 12];
%       names = {'A' 'B' 'C' 'D' 'E' 'F' 'G' 'H'};
%       G = graph(s,t,weights,names)
%       G.Edges
%       G.Nodes
%       plot(G,'EdgeLabel',G.Edges.Weight)




