function[error]=error_calculator(arrangement)
actual_arrangement(1,:)=1:8;
actual_arrangement(2,:)=[2,1,4,3,6,5,8,7];
actual_arrangement(3,:)=[8,7,6,5,4,3,2,1];
actual_arrangement(4,:)=[7,8,5,6,3,4,1,2];

[r,~]=size(arrangement);
error=0;
for i=1:r
    
    temp = arrangement(i,:);
    if(isequal(actual_arrangement(1,:),temp))
        continue;
    end
    
    if(isequal(actual_arrangement(2,:),temp))
      
        continue;
    end
    
    if(isequal(actual_arrangement(3,:),temp))
        
        continue;
    end
    
    if(isequal(actual_arrangement(4,:),temp))
       
        continue;
    end
    error=1;
    break;
end

end