
clear all;
Files=dir(fullfile('combined_data','*.mat')) ;
[num_files,index]=size(Files);
counter=1;
for file_counter = 1:num_files
    file = ['combined_data\',Files(file_counter).name];
    clear newPirArray;
    load(file);
    [R,C]=size(newPirArray);
    hour_count=1;
    for hours= 3:3:30
        sum_error=0;
        samples = 36000*hours;
        count_time =1;
        overlap = samples/2;
        for data_length = 1:overlap:C
            if(data_length+samples<C)
                combine_data = newPirArray(:,data_length:data_length+samples);
                power_consumption
                verification_algo
                sum_error=te+sum_error;
                count_time=count_time+1;
                
            end
            
        end
        evaluation_matrix(file_counter,hour_count) = sum_error/(count_time-1);
        hour_count=hour_count+1;
        
    end
    
end
