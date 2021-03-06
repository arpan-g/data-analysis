%% this script uses kmean clustering to classify the nodes using the
%correlation matrix obtained by correlating the energy matrix
% First step would be to remove the 1's for the same nodes it will
% mislead the kmean algorithm.
% clear
close all;
NO_ONES=10;
NO_CLUSTERS=2;
optimistic_neighbouring_map=...
    [ 0     1     1    -1     0     0     0     0;...
    1     0    -1     1     0     0     0     0;...
    1    -1     0     1     1    -1     0     0;...
    -1     1     1     0    -1     1     0     0;...
    0     0     1    -1     0     1     1    -1;...
    0     0    -1     1     1     0    -1     1;...
    0     0     0     0     1    -1     0     1;...
    0     0     0     0    -1     1     1     0];
% optimistic_neighbouring_map=abs(optimistic_neighbouring_map);NO_ONES=16;

[r,c]=size(R);
newGraph=zeros(r,c);
count =1;
for i = 1:r
    for j = i+1:r
        correlation(count)=R(i,j);
%         mapping(count)=optimistic_neighbouring_map(i,j);
        count = count + 1;
    end
end

[IDX,C]=kmeans(correlation',NO_CLUSTERS);

% if(C(2)>C(1))
[val,index]=min(C);

    IDX=IDX-index;
% end
IDX=abs(IDX);
no_zeros=sum(IDX(:)==0);
no_ones=sum(IDX(:));
count = 1;
for i = 1:r
    for j = i+1:r
        if(IDX(count)==0)
        newGraph(i,j)=0;
        else
            newGraph(i,j)=1;
        end
        %           graphMatrix=abs(graphMatrix);
        count = count + 1;
    end
end


% for i = 1:8
%     for j = 1:8
graphMatrix=newGraph+newGraph';

% falsepositive=0;
% for i= 1:8
%     for j = i+1:8
%         if(optimistic_neighbouring_map(i,j)==0)
%             if( optimistic_neighbouring_map(i,j)~=   graphMatrix(i,j));
%                 falsepositive=falsepositive+1;
%             end
%         end
%     end
% end
% falseNegative=0;
% for i= 1:8
%     for j = i+1:8
%         if(optimistic_neighbouring_map(i,j)==1)
%             if( optimistic_neighbouring_map(i,j)~=   graphMatrix(i,j));
%                 falseNegative=falseNegative+1;
%                 
%             end
%         end
%     end
% end
% te=falseNegative/NO_ONES+falsepositive/12;
% transC=correlation';
transMap=graphMatrix';
figure;
plot(transMap(IDX==0,1),transC(IDX==0,1),'r.','MarkerSize',12)

hold on
plot(transMap(IDX==1,1),transC(IDX==1,1),'b.','MarkerSize',12)
% plot(ones(1,2),C(:,1),'kx',...
%      'MarkerSize',15,'LineWidth',3)
legend('Non-Neighboring','Neighboring')
title 'Cluster Assignments'
xlim([-1.2 1.2]);
xlabel('class');
ylabel('çorrelation coefficient');
hold off


figure;
G= graph(graphMatrix,'OmitSelfLoops');
plot(G);
G= graph(graphMatrix);
% plot(G);

