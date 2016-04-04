% clear all;
% load('second.mat');
[r,c]=size(pir_array);
count = 1;
inside_count = 1;
while(inside_count<c)
    if(inside_count +2400<c)
    if(sum(pir_array(:,inside_count:inside_count+2400))==0)
        
        inside_count = inside_count +2400 ;
        end
    end
    newPirArray(:,count)=pir_array(:,inside_count);
    count=count+1;
    inside_count=inside_count+1;
    
end
save('other_data/0115.mat','newPirArray');