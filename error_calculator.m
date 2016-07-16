function[error]=error_calculator(arrangement)
actual_arrangement(1,:)=1:12;
actual_arrangement(2,:)=[3,2,1,6,5,4,9,8,7,12,11,10];




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
    
   
    error=1;
    break;
end

end