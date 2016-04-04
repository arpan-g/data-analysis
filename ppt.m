clear all;
optimistic_neighbouring_map=[ 1     1     0     -1    0     0     0     0;    1     1     -1     1     0     0     0     0;    1     -1     1     1     1     -1     0     0;    -1     1     1     1     -1     1     0     0;    0     0     1     -1     1     1     1     -1;    0     0     -1     1     1     1     -1     1;    0     0     0     0     1     -1     1     1;    0     0     0     0     -1     1     1     1];
optimistic_neighbouring_map=abs(optimistic_neighbouring_map);NO_ONES=16;count = 1;
for i = 1 :8
    for j = i+1:8
        if(sum(xor(optimistic_neighbouring_map(i,:),optimistic_neighbouring_map(j,:)))==0)
            hor_neighbors(count,:)=[i j];
            count = count + 1;
        end
    end
end
memsic_analysis
value=1;
end_value = 28710;
light_matrix=[node1(value,1:end_value);node2(value,1:end_value);node3(value,1:end_value);...
    node4(value,1:end_value);node5(value,1:end_value);node6(value,1:end_value); ...
node7(value,1:end_value);node8(value,1:end_value)];
mean_matrix=mean(light_matrix');
for i = 1:4
        if(mean_matrix(hor_neighbors(i,1))>mean_matrix(hor_neighbors(i,2)))
            orientation_matrix(i,1)='w';
            orientation_matrix(i,2)='d';
        else
             orientation_matrix(i,1)='d';
            orientation_matrix(i,2)='w';
        end
end

            