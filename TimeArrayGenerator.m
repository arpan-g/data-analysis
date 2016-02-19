function [ y ] = TimeArrayGenerator( time,count )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
for i = 1:count-1
    if(i==1)
        diff = time(i+1,1)-time(i,1);
        start = time(i,1) - diff;
        tempTime_1(:,1) = transpose(start:(diff/32):time(i,1));
    end
    if(i<count-1)
        diff = time(i+1,1)-time(i,1);
        tempTime_1(:,i+1) = transpose(time(i,1):(diff/32):time(i+1,1));
    end
end
tempTime_1(33,:) = [];
y = tempTime_1(:);

end

