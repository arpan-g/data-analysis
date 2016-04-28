%% get grid coordinates
fileID_local = fopen('edgeList.nls','w');
% adjacency_matrix=[1,1,1,zeros(1,5);1,1,0,1,zeros(1,4);1,0,1,1,1,0,0,0;0,1,1,1,0,1,0,0;0,0,1,0,1,1,1,0;0,0,0,1,1,1,0,1;0,0,0,0,1,0,1,1;0,0,0,0,0,1,1,1];
adjacency_matrix=remove_diagonal(graphMatrix,R);
[r,c]=size(adjacency_matrix);
for i = 1:r
    adjacency_matrix(i,i)=0;
end
figure
    G= graph(adjacency_matrix,'OmitSelfLoops');
plot(G);

for i = 1:r
    for j = i+1:c
        if(adjacency_matrix(i,j)==1)
            fprintf(fileID_local,'%1d %1d\n',i,j);
        end
    end
end
fclose(fileID_local);
dos('gLayout edgeList');

file='edgeList.nxy';
[c1 c2 c3]= textread(file, '%u %u %u', 'commentstyle', 'shell');




coordinates(c1,:)=[c2,c3];
% orientation vertical-horizontal 1-0
[normalized_cordinates,orientation]=compute_orientation(coordinates);
error= validate_custom(normalized_cordinates,orientation);
%     len=size(c1);
%
%
%
for i = 1:len
   plot(c2(i),c3(i),'+');
   text(c2(i),c3(i),num2str(i))
   hold on;

end





