% clear all;
% load('second.mat');
ticks=600*10;
[r,c]=size(pir_array);
count = 1;
inside_count = 1;
while(inside_count<c)
    if(inside_count +ticks<c)
        if(sum(pir_array(:,inside_count:inside_count+ticks))==0)
            
            inside_count = inside_count +ticks ;
        end
    end
    newPirArray(:,count)=pir_array(:,inside_count);
    count=count+1;
    inside_count=inside_count+1;
    
end
save([folder_name,'\ai_lab_',num2str(file_counter),'.mat'],'newPirArray');