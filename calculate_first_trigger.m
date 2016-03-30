function [last_trigger,counter,column_count]=calculate_first_trigger(matrix)
flag=0;
[r,c]=size(matrix);
counter=0;
for column_count = 1:c
    
    if(max(matrix(:,column_count))==0)
        counter=counter+1;
       
    else
        
        for row_count = 1:r
            if(matrix(row_count,column_count)==1)
                last_trigger(row_count)=1;
            else
                last_trigger(row_count)=0;
            end
        end
        if(counter>2400)
            flag=1;
            break;
        end
        counter = 0;
    end
    

end

    
end
