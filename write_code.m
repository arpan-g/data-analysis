file='test_trial.txt';
fileID_local = fopen(file,'w');


for i = 1:43
        for j = i+1:43
            if(a_m(i,j)==1)
    str=['large_ed.InsertEdge(',num2str(i-1),',',num2str(j-1),',',num2str(weight(i,j)),');'];
    fprintf(fileID_local,'%s',str);
%      str=['large_ed.InsertEdge(',num2str(node_e(i)-1),',',num2str(node_s(i)-1),',',num2str(R(node_s(i),node_e(i))),');'];
%     fprintf(fileID_local,'%s',str);
            end
        end
end
fclose(fileID_local);