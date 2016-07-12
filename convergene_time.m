file='master_data.mat';
count=1;
error_count=1;
for t = 3:3:30
    e=0;
    for start_time=1:t:90
        end_time=start_time+t;
        if(end_time<91)
            isomorphicTreeMatching_4x2;
            e=error_calculator(arrangement)+e;
            count=count+1;
        end
        
    end
    evaluation_matrix(error_count)=e;
    error_count=error_count+1;
end