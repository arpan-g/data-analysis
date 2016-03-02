function [ y ] = TimeArrayGenerator2(startTime,endTime,count )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
for i = 1:count-1
    
        diff = endTime(i)-startTime(i);
        start = startTime(i); 
        end_ = endTime(i);
        tempTime_1(:,i) = transpose(start:(diff/31):end_);
        
        
  
end

y = tempTime_1(:);

end

