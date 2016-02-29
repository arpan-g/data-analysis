
len=size(newPirArray);
transitionMatrix = zeros(8,len(2)-1);

for i = 1:8
    count =1;
    for j = 1:len(2)
        
        if(j>1 && j<len(2))
            if(newPirArray(i,j+1)>newPirArray(i,j))
                transitionMatrix(i,count)=1;
            elseif(newPirArray(i,j+1)<newPirArray(i,j))
                transitionMatrix(i,count)=-1;
            else 
                transitionMatrix(i,count)=0;
            end
                count = count +1;
        end
        
    end
end