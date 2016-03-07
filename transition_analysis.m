
len=size(newPirArray)
transitionMatrix = zeros(8,1);
analyzingMatrix=newPirArray;
% [array,counts,column_number]=calculate_first_trigger(newPirArray);

for i = 1:len(1)
    count =1;
    for j = 1:len(2)
        if(j==1)
            transitionMatrix(i,count)=analyzingMatrix(i,j);
        end
        if(j>1 && j<len(2))
            if(newPirArray(i,j+1)>analyzingMatrix(i,j))
                transitionMatrix(i,count)=1;
                %             elseif(newPirArray(i,j+1)<newPirArray(i,j))
                %             transitionMatrix(i,count)=-1;
            else
                transitionMatrix(i,count)=0;
            end
            count = count +1;
        end
        
    end
end
% trans
% transitionMatrix=[zeros(8,100),transitionMatrix];
figure;
imagesc(transitionMatrix);
len=size(transitionMatrix);
for i = 1:len(1)
    for j = 1:len(2)
        
        
    end
end
%  [val,index]=binary_xcorr(transitionMatrix(1,:),transitionMatrix(2,:),30);
