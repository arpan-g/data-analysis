file='test_trial.txt';
fileID_local = fopen(file,'w');
a_m=getAdjacencyMatrix();
[n,~]=size(a_m);

for i = 1:n
    for j = 1:n
        if(a_m(i,j)==1)
            %str=['add_edge(',num2str(node_s(i)-1),',',num2str(node_e(i)-1),',smallGraph);'];
            %             str=['small_ed.InsertEdge(',num2str(node_s(i)-1),',',num2str(node_e(i)-1), ',NULL);'];
            %             fprintf(fileID_local,'%s',str);
            %             str=['small_ed.InsertEdge(',num2str(node_e(i)-1),',',num2str(node_s(i)-1), ',NULL);'];
            %             fprintf(fileID_local,'%s',str);
            str=['large_ed.InsertEdge(',num2str(i-1),',',num2str(j-1), ',NULL);'];
            fprintf(fileID_local,'%s',str);
            
            
        end
    end
end
fclose(fileID_local);
