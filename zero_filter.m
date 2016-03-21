function [ filtered_array ] = zero_filter( pir_array )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
[r c] = size(pir_array);
count = 1;
for col= 1:c
    if(max(pir_array(:,col))~=0)
        filtered_array(:,count) = pir_array(:,col);
        count = count + 1;
    end
    
end

