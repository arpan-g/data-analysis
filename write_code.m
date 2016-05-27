file='test_trial.txt';
fileID_local = fopen(file,'w');


for i = 1:43
    for j = i+1:43
        if(a_m(i,j)==1)
        str=['R(a(',num2str(i),'),a(',num2str(j),'))+'];
        fprintf(fileID_local,'%s',str); 
        end
    end
end
fclose(fileID_local);