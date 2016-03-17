function [last_trigger,counter]=calculate_last_trigger(matrix)

[r,c]=size(matrix);
counter=0;
for column_count = 1:c
    
    if(max(matrix(:,column_count))==0)
        counter=counter+1;
        if(counter==2400)
            break
        end
    else
        counter = 0;
        for row_count = 1:r
            if(matrix(row_count,column_count)==1)
                last_trigger(row_count)=1;
            else
                last_trigger(row_count)=0;
            end
        end
    end
    
    
end