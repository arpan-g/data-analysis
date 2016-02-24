function [ y ] = similar_data( a,b,ele )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
length = size(a);
y=0;
for i = 1:length(2)
    
    if(a(i)==b(i))
        if(a(i)==ele)
            y=y+1;
        end
        
    end
    
end


end

