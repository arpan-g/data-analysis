function [ y , z ] = disimilar_data( a,b )
%UNTITLED3 Summary of this function goes here
%   number of 1's in the first variable and 0s in the second variable
length = size(a);
y=0;
z=0;
for i = 1:length(2)
    
    if(a(i)~=b(i))
        if(a(i)==1)
            y=y+1;
        else 
            z=z+1;
        end
        
        
    end
    
end


end

